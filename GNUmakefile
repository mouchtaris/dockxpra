SHELL = /bin/bash

intelli: irma Dockerfile.intelli.local
	docker build -t intelli -f Dockerfile.intelli.local .
irma: Dockerfile.irma
	docker build -t irma -f Dockerfile.irma .
	docker run -d -ti --name irma -P irma || true
Dockerfile.intelli.local: _/irma_ip Dockerfile.intelli
	sed -r -e 's/%%IRMA%%/'"$$(<_/irma_ip):1974"/ Dockerfile.intelli >$@
Dockerfile.irma:
_/irma_ip: _ irma
	docker inspect -f '{{ .NetworkSettings.IPAddress }}' irma >$@
_:
	mkdir -pv _
