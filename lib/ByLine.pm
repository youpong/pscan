use v5.38;

package ByLine;

sub cat ( $in, $out ) {
    while ( my $line = <$in> ) {
        print $out $line;
    }
}

1;