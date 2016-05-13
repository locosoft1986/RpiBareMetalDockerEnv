default: build
build: 
	docker build -t rpibaremetal .
shell:build
	docker run -ti --privileged -v $(shell pwd):/projects rpibaremetal bash


