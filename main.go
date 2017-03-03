package main

import (
	"flag"
	"log"
	"net/http"
)

var port = flag.String("port", "8888", "TCP port to use")
var htdocs = flag.String("htdocs", "/var/www/htdocs", "Full path to static files to load")

func init() {
	flag.Parse()
}

func main() {
	log.Printf("serving files from: %s\n", *htdocs)
	log.Printf("waiting for connections on port: %s\n", *port)
	err := http.ListenAndServe(":"+*port, http.FileServer(http.Dir(*htdocs)))
	if err != nil {
		log.Fatal(err)
	}
}
