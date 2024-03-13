use v5.38;

use ByChar;
use ByLine;
use ByFile;

use Test::More;
use File::Temp qw(tempfile);
use File::Compare;

my @srcs  = qw(text.ascii text.utf8 Perl-camel-small.png );
my %impls = (
    'ByChar::cat' => \&ByChar::cat,
    'ByLine::cat' => \&ByLine::cat,
    'ByFile::cat' => \&ByFile::cat
);

foreach my $src (map { "t/$_" } @srcs) {
    foreach my $impl ( keys %impls ) {
        open my $in, "<", $src || die;
        my ( $out, $dest ) = tempfile();
        $impls{$impl}->( $in, $out );
        close $in;
        close $out;
        is compare( $src, $dest ), 0, "impl: $impl, src: $src";
    }
}

done_testing;
