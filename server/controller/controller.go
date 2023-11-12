package controller

import (
	"context"
	"encoding/json"
	"fmt"
	"github/Yash-Khattar/yogzen-server/constant"
	"github/Yash-Khattar/yogzen-server/model"
	"log"
	"net/http"
	"time"

	"github.com/golang-jwt/jwt"
	"github.com/gorilla/mux"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"golang.org/x/crypto/bcrypt"
)

var collection *mongo.Collection

func init() {
	clientOption := options.Client().ApplyURI(constant.Mongodbkey)
	client, err := mongo.Connect(context.TODO(), clientOption)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("MongoDB connected successfully")
	collection = client.Database(constant.DbName).Collection(constant.ColName)
}

// func error(err error ){
// log.Fatal(err)
// }

//APIS

//Authentication

// signup
func SignUp(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var user model.UserModel
	json.NewDecoder(r.Body).Decode(&user)
	password := []byte(user.Password)
	filter := bson.M{"email": user.Email}
	var result bson.M
	err := collection.FindOne(context.Background(), filter).Decode(&result)

	if err != nil {
		// no doc found => signup
		if err == mongo.ErrNoDocuments {
			json.NewEncoder(w).Encode("no document found")
			hashedPassword, err := bcrypt.GenerateFromPassword(password, bcrypt.DefaultCost)
			if err != nil {
				log.Fatal(err)
			}
			user.Password = string(hashedPassword)
			inserted, _ := collection.InsertOne(context.Background(), user)
			json.NewEncoder(w).Encode(inserted)
			return
		}
		log.Fatal(err)
	}
	//login api call
	w.WriteHeader(http.StatusBadRequest)
	json.NewEncoder(w).Encode("document found : login instead")
	fmt.Printf("found document %v", result)
}

// signin
func SignIn(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var user model.UserModel
	// email and password
	json.NewDecoder(r.Body).Decode(&user)
	password := []byte(user.Password)
	filter := bson.M{"email": user.Email}
	var result bson.M
	err := collection.FindOne(context.Background(), filter).Decode(&result)
	if err != nil {
		if err == mongo.ErrNoDocuments {
			// user does not exists => sign up
			w.WriteHeader(http.StatusBadRequest)
			json.NewEncoder(w).Encode("user does not exist, signup instead")
			return
		}
		log.Fatal(err)
	}
	//user exists
	//match password
	bsonBytes, _ := bson.Marshal(result)
	bson.Unmarshal(bsonBytes, &user)

	err = bcrypt.CompareHashAndPassword([]byte(user.Password), password)
	// nil means it is a match
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		json.NewEncoder(w).Encode("wrong password")
		return
	}
	//jwt token
	token, err := createToken(user.ID.Hex())
	json.NewEncoder(w).Encode(token)

}

// create jwt token

func createToken(id string) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256,
		jwt.MapClaims{
			"id":  id,
			"exp": time.Now().Add(time.Hour * 24).Unix(),
		})

	tokenString, err := token.SignedString(constant.SecretKey)
	if err != nil {
		return "", err
	}

	return tokenString, nil
}

// verify token
func VerifyToken(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)

	// if token is empty
	if params["token"] == "" {
		json.NewEncoder(w).Encode(false)
	}

	// if token is valid
	err := verifyJWTToken(params["token"])
	if err != nil {
		json.NewEncoder(w).Encode(false)
		return
	}

	// if user is empty

	json.NewEncoder(w).Encode(true)

}

// jwt verify
func verifyJWTToken(tokenString string) error {
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		return constant.SecretKey, nil
	})

	if err != nil {
		return err
	}

	if !token.Valid {
		return fmt.Errorf("invalid token")
	}

	return nil
}
