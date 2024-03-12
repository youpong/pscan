use v5.38;

sub cat ( $in, $out ) {
    while ( my $line = <$in> ) {
        print $out $line;
    }
}

cat( *STDIN, *STDOUT );
