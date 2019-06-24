package Proverb;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(proverb);


sub proverb {
    my ($word_list, $qualifier) = @_;

    my @proverbs = map {
        "For want of a $word_list->[$_] the $word_list->[$_+1] was lost.\n"
    } 0 .. @$word_list-2;

    my $last_line_item = $word_list->[0];
    $last_line_item = $qualifier . " " . $last_line_item if $qualifier;

    push @proverbs, "And all for the want of a $last_line_item.";

    return join("", @proverbs);
}