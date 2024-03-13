use v5.38;

use ByChar;
use ByLine;
use ByFile;

use Test::More;
use File::Temp qw(tempfile);
use File::Compare;

my %srcs = (
    'text.ascii'           => 'encoding(ISO-8859-1)',
    'text.utf8'            => 'encoding(UTF-8)',
    'Perl-camel-small.png' => ''
);
my %impls = (
    'ByChar::cat' => \&ByChar::cat,
    'ByLine::cat' => \&ByLine::cat,
    'ByFile::cat' => \&ByFile::cat
);

foreach my $src ( keys %srcs ) {
    foreach my $impl ( keys %impls ) {
        my $path = "t/$src";
        open my $in, "<:$srcs{$src}", $path || die;
        my ( $out, $dest ) = tempfile();
        binmode( $out, "$srcs{$src}" ) if $srcs{$src};

        $impls{$impl}->( $in, $out );

        close $in;
        close $out;

        is compare( $path, $dest ), 0, "impl: $impl, src: $path";
    }
}

done_testing;
