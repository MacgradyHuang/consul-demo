package main

import (
	"io/ioutil"
	"log"
	"net/http"
)

func docker_handler(w http.ResponseWriter, r *http.Request) {
	resp, err := http.Get("http://backend:8080")
	if err != nil {
		log.Fatal(err)
	}

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatal(err)
	}

	w.Write(body)
}

func consul_handler(w http.ResponseWriter, r *http.Request) {
	resp, err := http.Get("http://backend.service.consul:8080")
	if err != nil {
		log.Fatal(err)
	}

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatal(err)
	}

	w.Write(body)
}

func www_handler(w http.ResponseWriter, r *http.Request) {
	resp, err := http.Get("http://fortytwo-as-a-service.herokuapp.com/")
	if err != nil {
		log.Fatal(err)
	}

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatal(err)
	}
	w.Write(body)
}

func main() {
	http.HandleFunc("/docker", docker_handler)
	http.HandleFunc("/consul", consul_handler)
	http.HandleFunc("/www", www_handler)
	http.ListenAndServe(":8081", nil)
}
