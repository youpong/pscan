use v5.38;

sub cat( $in, $out ) {
    my $content = do { local $/; <$in> };
    print $out $content;
}

cat( *STDIN, *STDOUT );
