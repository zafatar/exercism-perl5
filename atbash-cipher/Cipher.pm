package Cipher;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(encode decode);

my $CIPHER_KEY = "abcdefghijklmnopqrstuvwxyz";
my $CIPHER_KEY_LEN = length $CIPHER_KEY;

my @key = split('', $CIPHER_KEY);
my $position = 1;
my %map = map { $_ => $position++ } @key;

sub encode {
    my ($input) = @_;

    my $output = _transform($input);
    $output = _split_with_spaces($output);

    return $output;
}

sub decode {
    my ($input) = @_;

    return _transform($input);
}

sub _transform {
    my ($input) = @_;

    return join('',
                map { $map{$_} ? $key[$CIPHER_KEY_LEN - $map{$_}] : $_ } 
                grep {$_ =~ /[a-z1-9]/} 
                split('', lc($input))
            );
}

sub _split_with_spaces {
    my ($input, $batch_size) = @_;
    $batch_size ||= 5;

    return join ' ', $input =~ /(.{1,$batch_size})/g;
}

1;