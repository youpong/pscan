#!/bin/bash

cd ${0%/*}

# test for Text(ASCII, UTF-8), binary file
for script in char.pl line.pl file.pl; do
    for src in text.ascii text.utf8 Perl-camel-small.png ; do
        if ! cmp $src <(cat $src | perl ../$script); then 
            echo "script: $script, src: $src" >&2
            exit 1
        fi
    done
done

echo "Ok."