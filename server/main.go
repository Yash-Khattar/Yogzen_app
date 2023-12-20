package main

import (
	"fmt"
	// "github/Yash-Khattar/yogzen-server/router"
	controller "github/Yash-Khattar/yogzen-server/controller"
	routes "github/Yash-Khattar/yogzen-server/routes"
	"os"

	"log"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func main() {
	fmt.Println("Welcome to Yogzen")
	// r := router.Router()
	// log.Fatal(http.ListenAndServe(":3000", r))
	// fmt.Println("connection success")
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatal("error loading env file")
	}
	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}
	router := gin.New()
	router.Use(gin.Logger())

	router.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Welcome to Yogzen",
		})
	})
	// router.POST("/addYoga", controller.AddYoga())
	router.GET("/api/getAllYoga", controller.GetYoga())

	//routers
	routes.AuthRouter(router)
	routes.UserRoutes(router)
	// routes.YogaRouter(router)
	router.Run(":" + port)
}
