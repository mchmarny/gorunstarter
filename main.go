package main

import (
	"fmt"
	"log"
	"net"
	"net/http"
	"os"
)

func main() {

	log.Print("Hello service started")

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		log.Print("Hello service invoked")
		message := os.Getenv("MESSAGE")
		fmt.Fprintf(w, "%s\n", message)
	})

	// Set HTTP listening port
	// https://cloud.google.com/run/docs/reference/container-contract#port
	httpPort := os.Getenv("PORT")
	if httpPort == "" {
		httpPort = "8080"
	}

	hostPost := net.JoinHostPort("0.0.0.0", httpPort)

	if err := http.ListenAndServe(hostPost, nil); err != nil {
		log.Fatal(err)
	}
}
