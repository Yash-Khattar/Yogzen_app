package routes

import (
	controller "github/Yash-Khattar/yogzen-server/controller"

	"github.com/gin-gonic/gin"
)

func AuthRouter(incomingAuthRoutes *gin.Engine) {
	incomingAuthRoutes.POST("users/signup", controller.Signup())
	incomingAuthRoutes.POST("users/login", controller.Login())
}
