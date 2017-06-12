build:
	@mkdir -p bin && \
	GOOS=linux GOARCH=amd64 go build -o bin/consul-example-frontend

build-local:
	go build

image: clean build
	docker build -t valfadeev/consul-example-frontend .

clean:
	rm -f bin/*

upload:
	docker push valfadeev/consul-example-frontend

run:
	docker run -it --rm -p 8081:8081 valfadeev/consul-example-frontend
