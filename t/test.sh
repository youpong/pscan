#!/bin/bash

#src=Perl-camel-small.png

function error() {
    echo "Error: line $@" >&2
    exit 1
}

# test for Text(ASCII, UTF-8), binary file
for src in text.ascii text.utf8 Perl-camel-small.png ; do
    cmp $src <(cat $src | perl char.pl) || error "$LINENO: src: $src"
    cmp $src <(cat $src | perl line.pl) || error "$LINENO: src: $src"
    cmp $src <(cat $src | perl file.pl) || error "$LINENO: src: $src"
done

echo "Ok."