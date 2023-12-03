package routes

import (
	controller "github/Yash-Khattar/yogzen-server/controller"

	"github.com/gin-gonic/gin"
)

func AuthRouter(incomingRoutes *gin.Engine) {
	incomingRoutes.POST("auth/signup", controller.Signup())
	incomingRoutes.POST("auth/login", controller.Login())
}
