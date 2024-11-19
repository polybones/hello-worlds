set working-directory := 'samples'

alias help := _help

@_help:
    just --list

# Runs all hello world scripts
@all: \
    ada \
    asm \
    c \
    c3 \
    crystal \
    cpp \
    java \
    js \
    lua \
    perl \
    python \
    rust \
    sh

# Languages

@ada:
    gnatmake -o /tmp/hello_ada hello_world.ada &>/dev/null
    /tmp/hello_ada

# (x86 Intel)
@asm:
    as -msyntax=intel -mnaked-reg -o /tmp/build.asm hello_world.asm
    ld -s -o /tmp/hello_asm /tmp/build.asm
    /tmp/hello_asm

@c:
    gcc -Wextra -Wall -O2 -o /tmp/hello_c hello_world.c
    /tmp/hello_c

@c3:
    c3c compile -O1 -o /tmp/hello_c3 hello_world.c3 &>/dev/null
    /tmp/hello_c3

@cpp:
    g++ -Wextra -Wall -O2 -o /tmp/hello_cpp hello_world.cpp
    /tmp/hello_cpp

@crystal:
    crystal build --release -o /tmp/hello_crystal hello_world.cr
    /tmp/hello_crystal

@java:
    java hello_world.java

# (NodeJS)
@js:
    node hello_world.js
    
@lua:
    lua hello_world.lua

@perl:
    perl hello_world.pl

@python:
    python hello_world.py

@rust:
    rustc -O -o /tmp/hello_rust hello_world.rs
    /tmp/hello_rust

@sh:
    ./hello_world.sh
