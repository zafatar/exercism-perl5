package Prime;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(factors);

my $FIRST_PRIME = 2;

sub factors {
    my $remaining = shift;
    my @dividors;
    my $dividor = $FIRST_PRIME;     # start with the first prime number.

    while ($dividor * $dividor <= $remaining) {
        if ($remaining % $dividor == 0) {
            push @dividors, $dividor;
            $remaining = $remaining / $dividor; 
        }
        else {
            $dividor++;
        }
    }

    push @dividors, $remaining if $remaining > 1;

    return \@dividors;
}

1;