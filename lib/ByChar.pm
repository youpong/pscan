use v5.38;

package ByChar;

sub cat ( $in, $out ) {
    while ( defined( my $c = getc($in) ) ) {
        print $out $c;
    }
}

1;