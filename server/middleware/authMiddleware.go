package middleware

import (
	helper "github/Yash-Khattar/yogzen-server/helper"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

// token is valid or not
func Authenticate() gin.HandlerFunc {
	return func(c *gin.Context) {
		log.Println("Inside Authenticate()")
		clientToken := c.Request.Header.Get("token")
		if clientToken == "" {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "no authrization headers provided"})

			c.Abort()
			return
		}

		claims, err := helper.ValidateToken(clientToken)
		if err != "" {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err})
			c.Abort()
			return

		}
		c.Set("email", claims.Email)
		c.Set("name", claims.Name)
		c.Set("uid", claims.Uid)
		c.Set("userType", claims.User_type)
		c.Next()
	}
}
