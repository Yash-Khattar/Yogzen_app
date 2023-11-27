package main

import (
	"fmt"
	// "github/Yash-Khattar/yogzen-server/router"

	routes "github/Yash-Khattar/yogzen-server/routes"
	"os"

	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("Welcome to Yogzen")
	// r := router.Router()
	// log.Fatal(http.ListenAndServe(":3000", r))
	// fmt.Println("connection success")
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
	routes.AuthRouter(router)
	routes.UserRoutes(router)
	router.Run(":" + port)
}
