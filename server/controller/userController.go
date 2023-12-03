package controller

import (
	"context"
	"fmt"
	"github/Yash-Khattar/yogzen-server/database"
	"github/Yash-Khattar/yogzen-server/helper"
	"github/Yash-Khattar/yogzen-server/model"
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"golang.org/x/crypto/bcrypt"
)

var userCollection *mongo.Collection = database.OpenCollection(database.Client, "user")
var validate = validator.New()

// hashing password
func HashPassword(password string) string {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), 14)
	if err != nil {
		log.Panic(err)
	}
	return string(hashedPassword)
}

// verifying password
func VerifyPassword(userPassword string, providedPassword string) (bool, string) {
	err := bcrypt.CompareHashAndPassword([]byte(providedPassword), []byte(userPassword))
	check := true
	msg := ""

	if err != nil {
		msg = fmt.Sprintf("password is incorrect")
		check = false
	}
	return check, msg
}

// signup
func Signup() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		defer cancel()
		var user model.User
		fmt.Print("hello")
		
		fmt.Print(c)
		//binding user data from request to user struct
		if err := c.BindJSON(&user); err != nil {
			fmt.Print(&user)
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}
		//apply validation on user data
		validationErr := validate.Struct(user)
		if validationErr != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": validationErr.Error()})
			return
		}
		//check if user already exists
		count, err := userCollection.CountDocuments(ctx, bson.M{"email": user.Email})
		// defer cancel()
		if err != nil {
			log.Panic(err)
			c.JSON(http.StatusInternalServerError, gin.H{"error": "error while checking email"})
			return
		}
		password := HashPassword(*user.Password)
		user.Password = &password
		if count > 0 {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "user alraedy exists"})
			return
		}

		//creating tokens and ids
		user.CreatedAt, _ = time.Parse(time.RFC3339, time.Now().Format(time.RFC3339))
		user.UpdatedAt, _ = time.Parse(time.RFC3339, time.Now().Format(time.RFC3339))
		user.ID = primitive.NewObjectID()
		user.UserId = user.ID.Hex()
		token, refreshToken, err := helper.GenerateAllToken(*user.Email, *user.Name, *user.UserType, user.UserId)
		if err != nil {
			log.Panic(err)
			c.JSON(http.StatusInternalServerError, gin.H{"error": "token error"})
			return
		}
		user.Token = &token
		user.RefreshToken = &refreshToken

		//inserting user in db
		resultInsertedNumber, insertErr := userCollection.InsertOne(ctx, &user)
		if insertErr != nil {
			msg := fmt.Sprint("User item was not created")
			c.JSON(http.StatusInternalServerError, gin.H{"error": msg})
			return
		}
		c.JSON(http.StatusOK, resultInsertedNumber)

	}
}

func Login() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		defer cancel()
		var user model.User
		var foundUser model.User
		if err := c.BindJSON(&user); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		// finding if user exists
		err := userCollection.FindOne(ctx, bson.M{"email": user.Email}).Decode(&foundUser)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "email or password is incorrect"})
			return
		}

		passwordIsValid, msg := VerifyPassword(*user.Password, *foundUser.Password)
		if !passwordIsValid {
			c.JSON(http.StatusInternalServerError, gin.H{"error": msg})
			return
		}
		if foundUser.Email == nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "user not found"})
			return
		}
		token, refreshToken, err := helper.GenerateAllToken(*foundUser.Email, *foundUser.Name, *foundUser.UserType, foundUser.UserId)
		if err != nil {
			log.Panic(err)
			c.JSON(http.StatusInternalServerError, gin.H{"error": "token error"})
			return
		}
		helper.UpdateAllToken(token, refreshToken, foundUser.UserId)
		err = userCollection.FindOne(ctx, bson.M{"userid": foundUser.UserId}).Decode(&foundUser)

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, foundUser)

	}
}

func GetUser() gin.HandlerFunc {
	return func(c *gin.Context) {
		userId := c.Param("user_id")

		if err := helper.MachUserTypeToUid(c, userId); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		}
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)

		var user model.User
		err := userCollection.FindOne(ctx, bson.M{"userid": userId}).Decode(&user)
		defer cancel()
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, user)

	}
}

// 			func GetUsers() gin.HandlerFunc {
// 				return func(c *gin.Context) {
// 					err := helper.CheckUserType(c, "ADMIN")
// 					if err != nil {
// 						c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
// 						return
// 					}
// 					var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
// 					defer cancel()
// 					recordPerPage, err := strconv.Atoi(c.Query("recordPerPage"))
// 					if err != nil || recordPerPage < 1 {
// 						recordPerPage = 10
// 					}
// 					page, err1 := strconv.Atoi(c.Query("page"))
// 					if err1 != nil || page < 1 {
// 						page = 1
// 					}
// 					startIndex := (page -1)* recordPerPage
// 								startIndex, err = strconv.Atoi(c.Query("startIndex"))
// 			matchStage := bson.D{{"$match", bson.D{{}}}

// 			groupStage := bson.D{{"$group", bson.D{{"_id", bson.D{{"_id", "null"}}},{"total_count", bson.D{{"$sum", 1}}}, {"data", bson.D{{"$push", "$root"}}},}}}
// 			projectStage := bson.D{
// 				{
// 					"$project", bson.D{
// 					{"_id", 0}, {"total_count". 1},
// 					{"user_items", bson.D{{"$slice", []interface{}{"$data", startIndex, recordPerPage}}}}
// 					},
// 				}
// 			}

// 			}}
// }
