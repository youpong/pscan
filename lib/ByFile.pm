use v5.38;

package ByFile;

sub cat( $in, $out ) {
    my $content = do { local $/; <$in> };
    print $out $content;
}

1;