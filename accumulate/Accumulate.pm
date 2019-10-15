package Accumulate;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(accumulate);

sub accumulate {
    my ($input, $sub) = @_;
    return [map { $sub->($_)} @$input];
}

1;
