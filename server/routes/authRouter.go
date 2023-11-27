package routes

import (
	controller "github/Yash-Khattar/yogzen-server/controller"

	"github.com/gin-gonic/gin"
)

func AuthRouter(incomingRouter *gin.Engine) {
	incomingRouter.POST("auth/signup", controller.Signup())
	incomingRouter.POST("auth/login", controller.Login())
}
