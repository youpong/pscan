#!/bin/bash

src=Perl-camel-small.png

function error() {
    echo "Error: line $@" >&2
    exit 1
}

cmp $src <(cat $src | perl char.pl) || error "$LINENO"
cmp $src <(cat $src | perl line.pl) || error "$LINENO"
cmp $src <(cat $src | perl file.pl) || error "$LINENO"

echo "Ok."