build:
	@mkdir -p bin && \
	GOOS=linux GOARCH=amd64 go build -o bin/consul-example-backend

build-local:
	go build

image: clean build
	docker build -t valfadeev/consul-example-backend .

clean:
	rm -f bin/*

upload:
	docker push valfadeev/consul-example-backend

run:
	docker run -it --rm -p 8080:8080 valfadeev/consul-example-backend
