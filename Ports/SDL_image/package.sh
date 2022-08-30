#!/usr/bin/env -S bash ../.port_include.sh
port='SDL_image'
useconfigure='true'
version='1.2.12'
depends=("sdl12-compat")
files="https://www.libsdl.org/projects/SDL_image/release/SDL_image-1.2.12.tar.gz SDL_image-${version}.tar.gz 0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699"
use_fresh_config_sub=true
auth_type='sha256'

configure() {
    run ./configure \
        --host="${SERENITY_ARCH}-pc-serenity" \
        --with-sdl-prefix="${SERENITY_INSTALL_ROOT}/usr/local" \
        --enable-webp=false --enable-webp-shared=false     \
        --disable-static \
        --enable-shared \
        LDFLAGS="-lgui -lgfx -lipc -lcore -lm"
}

build() {
    run make -k
}
