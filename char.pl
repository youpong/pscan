use v5.38;

while ( defined( my $c = getc(STDIN) ) ) {
    print STDOUT $c;
}
