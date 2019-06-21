package Proverb;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(proverb);


sub proverb {
    my ($word_list, $qualifier) = @_;
    my $proverb = [];

    for (my $i=0; $i < scalar(@$word_list) - 1; $i++) {
        push @$proverb, "For want of a $word_list->[$i] the $word_list->[$i+1] was lost.\n";
    }

    my $last_line_item = $word_list->[0];
    $last_line_item = $qualifier . " " . $last_line_item if $qualifier;

    push @$proverb, "And all for the want of a $last_line_item.";

    return join("", @$proverb);
}