requires 'perl', 'v5.38.2';

on test => sub {
    requires 'File::Temp';
    requires 'Test::More';
    requires 'Test::Harness';
};

on develop => sub {
    requires 'Perl::Tidy', '== 20240202';
};
