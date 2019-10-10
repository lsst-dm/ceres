#!/usr/bin/env bash

TAP_PACKAGE=1

config()
{
    ARGS=()

    ARGS+=("-DEIGEN_INCLUDE_DIR_HINTS=$EIGEN_DIR/include")
    ARGS+=("-DCMAKE_INSTALL_PREFIX=$PREFIX")
    ARGS+=("-DMINIGLOG=true")

    (rm -rf build && mkdir build && cd build && cmake "${ARGS[@]}" ..)
}

build()
{
    (cd build && make)
}

install()
{
    clean_old_install
    (cd build && make install)
    install_ups
}

