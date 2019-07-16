package Anagram;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(match);

sub match {
    my ($word, @words) = @_;
    my $sorted_word = sort_string($word);

    return [
        grep {
            $sorted_word eq sort_string($_) and $word ne $_
        } @words
    ]
}

sub sort_string {
    my ($input) = @_; 
    return join('', sort( split('', lc($input))));
}