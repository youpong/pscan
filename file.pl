use v5.38;

my $content = do { local $/; <STDIN> };
print $content;
