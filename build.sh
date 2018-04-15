#!/bin/bash
sed -i '/components.png \\/{n;d}' doc/Makefile.in && \
./configure --prefix=/usr \
            --disable-static \
            --enable-docs && \
make -j $SHED_NUM_JOBS && \
make DESTDIR="$SHED_FAKE_ROOT" install && \
install -v -m644 doc/Vorbis* "${SHED_FAKE_ROOT}/usr/share/doc/libvorbis-1.3.5"
