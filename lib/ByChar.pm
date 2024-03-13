use v5.38;

package ByChar;

sub cat ( $in, $out ) {
    while ( defined( my $c = getc($in) ) ) {
        print $out $c;
    }
}

# getc() returns a byte if the file handle's binmode is binary, otherwise it 
# returns a single character.

1;
