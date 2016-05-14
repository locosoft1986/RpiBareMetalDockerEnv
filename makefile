default: build
build: 
	docker build -t rpibaremetal .
shell:build
	docker run -ti --privileged -v $(shell pwd):/projects rpibaremetal bash

shwin:build
	docker run -ti --privileged -v /workspace:/projects rpibaremetal bash
