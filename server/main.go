package main

import (
	"fmt"
	"github/Yash-Khattar/yogzen-server/router"
	"log"
	"net/http"
)

func main() {
	fmt.Println("Welcome to Yogzen")
	r := router.Router()
	log.Fatal(http.ListenAndServe(":3000", r))
	fmt.Println("connection success")
}
