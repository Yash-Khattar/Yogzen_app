package database

import (
	"context"
	"fmt"
	"github/Yash-Khattar/yogzen-server/constant"
	"log"
	"os"
	"time"

	"github.com/joho/godotenv"

	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)




func DBinstance() *mongo.Client {
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatal("error loading env file")
	}

	MongoDb := os.Getenv("MONGODB_URL")
	clientOption := options.Client().ApplyURI(MongoDb)
	

ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
defer cancel()
client, err := mongo.Connect(ctx, clientOption)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("MongoDB connected successfully")
	return client
	
}

var Client *mongo.Client = DBinstance()

func OpenCollection(client *mongo.Client, collectionName string) *mongo.Collection{
var	collection *mongo.Collection = client.Database(constant.DbName).Collection(collectionName)
return collection
}

