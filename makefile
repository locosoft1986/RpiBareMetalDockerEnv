default: build
build: 
	docker build -t rpibaremetal .
shell:build
	docker run -ti --user root -v $(shell pwd):/projects rpibaremetal bash

shwin:build
	docker run -ti --user root -v /workspace:/projects rpibaremetal bash
