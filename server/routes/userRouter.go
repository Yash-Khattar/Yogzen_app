package routes

import (
	controller "github/Yash-Khattar/yogzen-server/controller"

	"github/Yash-Khattar/yogzen-server/middleware"

	"github.com/gin-gonic/gin"
)

func UserRoutes(incomingUserRoutes *gin.Engine) {
	incomingUserRoutes.Use(middleware.Authenticate())

	incomingUserRoutes.GET("/users/:user_id", controller.GetUser())
}
