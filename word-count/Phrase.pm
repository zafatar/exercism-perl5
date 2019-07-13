package Phrase;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(word_count);

sub word_count {
    my ($input) = @_;

    # cleaning.
    $input =~ s/[\p{Punct}\^\$]//gs;  # Punctuation and some special chars.
    $input =~ s/\s+/ /gs;             # multiple space to single one.

    # building up word array.
    my @words = split(' ', lc($input));

    # counting occurrences of each word.
    my $output = {};
    $output->{$_}++ for @words; 

    return $output;
}

1;
