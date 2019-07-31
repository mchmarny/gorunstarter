package main

import (
	"fmt"
	"log"
	"net"
	"net/http"
	"os"
)

func main() {

	// handler
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "hello")
	})

	// port
	httpPort := os.Getenv("PORT")
	if httpPort == "" {
		httpPort = "8080"
	}

	// host
	hostPost := net.JoinHostPort("0.0.0.0", httpPort)

	// server
	if err := http.ListenAndServe(hostPost, nil); err != nil {
		log.Fatal(err)
	}
}
