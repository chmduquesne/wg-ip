PREFIX = /usr/local

all:
	./wg-ip --test

install:
	mkdir -p "${DESTDIR}${PREFIX}/bin"
	install -m755 wg-ip "${DESTDIR}${PREFIX}/bin/wg-ip"
