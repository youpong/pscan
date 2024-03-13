use v5.38;

use ByChar;
use ByLine;
use ByFile;

use Test::More;
use File::Temp qw(tempfile);
use File::Compare;

my @srcs = (
    { filename => 'text.ascii',           encoding => 'ISO-8859-1' },
    { filename => 'text.utf8',            encoding => 'UTF-8' },
    { filename => 'Perl-camel-small.png', encoding => '' },
);
my %impls = (
    'ByChar::cat' => \&ByChar::cat,
    'ByLine::cat' => \&ByLine::cat,
    'ByFile::cat' => \&ByFile::cat
);

foreach my $src (@srcs) {
    foreach my $impl ( keys %impls ) {
        my $src_path     = "t/" . $src->{filename};
        my $src_encoding = $src->{encoding} ? "<:encoding($src->{encoding})" : "<";

        open my $in, $src_encoding, $src_path || die;
        my ( $out, $dest_path ) = tempfile();
        binmode( $out, "encoding($src->{encoding})" ) if $src->{encoding};

        $impls{$impl}->( $in, $out );

        close $in;
        close $out;

        is compare( $src_path, $dest_path ), 0, "impl: $impl, src: $src_path";
    }
}

done_testing;
