#!/bin/bash
sed -i '/components.png \\/{n;d}' doc/Makefile.in && \
./configure --prefix=/usr \
            --disable-static \
            --enable-docs && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install && \
install -v -m644 doc/Vorbis* "${SHED_FAKEROOT}/usr/share/doc/libvorbis-1.3.5"
