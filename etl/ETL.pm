package ETL;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(transform);

sub transform {
    my ($old) = @_;

    my %new = map { 
        my $number = $_;
        map { lc($_) => $number } @{$old->{$number}} 
    } keys %$old;

    return \%new;
}