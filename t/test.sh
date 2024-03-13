#!/bin/bash

function error() {
    echo "Error: $@" >&2
    exit 1
}

cd ${0%/*}

# test for Text(ASCII, UTF-8), binary file
for script in char.pl line.pl file.pl; do
    for src in text.ascii text.utf8 Perl-camel-small.png ; do
        cmp $src <(cat $src | perl ../$script) || error "script: $script, src: $src"
    done
done

echo "Ok."