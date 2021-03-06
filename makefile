# Microscheme makefile
# (C) 2014 Ryan Suchocki
# microscheme.org

PREFIX?=/usr/local

all: hexify build

hexify:
	echo "// Hexified internal microscheme files." > src/assembly_hex.c
	xxd -i src/preamble.s >> src/assembly_hex.c

	echo "// Hexified internal microscheme files." > src/microscheme_hex.c
	xxd -i src/primitives.ms >> src/microscheme_hex.c
	xxd -i src/stdlib.ms >> src/microscheme_hex.c

build:
	gcc -ggdb -std=gnu99 -Wall -Wextra -o microscheme src/*.c

install:
	install -Dm755 ./microscheme $(PREFIX)/bin/microscheme
	install -d $(PREFIX)/share/microscheme/
	cp -r examples/ $(PREFIX)/share/microscheme/
