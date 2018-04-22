default: build

# Current version
version = 0.2.0

# Build docker image
build:
	docker build -t tm/sitio-ca:$(version) .
	docker save -o sitio-ca.tar tm/sitio-ca
	gzip sitio-ca.tar

# Run docker container
run-docker:
	docker run -it -P --rm tm/sitio-ca:$(version)
