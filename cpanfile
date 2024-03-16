requires 'perl', 'v5.38.2';

on test => sub {
    requires 'File::Temp';
    requires 'Test::More', '== 1.302198';
    requires 'Test::Harness', '== 3.48';
};

on develop => sub {
    requires 'Perl::Tidy', '== 20240202';
};
