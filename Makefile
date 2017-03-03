default: build

# Build for the default architecture in use
build:
	go build -v -o sitio-ca

# Redownload all dependencies
clean:
	rm -rf vendor glide.lock
	glide install

# Run as a native CLI
run:
	./sitio-ca -htdocs ./htdocs

# Build server for Linux and pack it with the contents
docker:
	env GOOS=linux GOARCH=amd64 go build -v -o sitio-ca
	docker build -t tm/sitio-ca .
	docker save -o sitio-ca.tar tm/sitio-ca
	gzip sitio-ca.tar
	rm sitio-ca

# Run as a docker container
run-docker:
	docker run -it -P --rm tm/sitio-ca
