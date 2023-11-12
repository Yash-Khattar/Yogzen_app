package router

import (
	"github/Yash-Khattar/yogzen-server/controller"

	"github.com/gorilla/mux"
)

func Router() *mux.Router {
	router := mux.NewRouter()
	router.HandleFunc("/auth/signup", controller.SignUp).Methods("POST")
	router.HandleFunc("/auth/signin", controller.SignIn).Methods("POST")
	router.HandleFunc("/auth/verifytoken/{token}", controller.VerifyToken).Methods("GET")

	return router
}
