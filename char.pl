use v5.38;

sub cat ( $in, $out ) {
    while ( defined( my $c = getc($in) ) ) {
        print $out $c;
    }
}

cat( *STDIN, *STDOUT );
