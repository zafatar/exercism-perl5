package Palindrome;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(largest smallest);

my $MIN_FACTOR = 1;

sub new {
    my ($class, $args) = @_;
    my $self = {
        min_factor => $args->{min_factor} || $MIN_FACTOR,
        max_factor => $args->{max_factor}
    };

    bless($self, $class);

    $self->{palindromes} = $self->_find_palindromes();

    return $self;
}

sub largest {
    my ($self) = @_;

    my $palindromes = $self->{palindromes};

    my ($largest) = reverse sort { $a <=> $b } keys %$palindromes;

    return $palindromes->{$largest};
}

sub smallest {
    my ($self) = @_;

    my $palindromes = $self->{palindromes};

    my ($smallest) = sort { $a <=> $b } keys %$palindromes;

    return $palindromes->{$smallest};
}

sub _find_palindromes {
    my ($self) = @_;
    my %PALINDROMES = ();

    # Loop all possible (x, y) factors.
    foreach my $x ($self->{min_factor}..$self->{max_factor}) {
        foreach my $y ($x..$self->{max_factor}) {
            my $product = $x * $y;

            # detect palindromes
            if ($product == reverse($product)) {
                # initialize the palindrome data structure
                if (not defined $PALINDROMES{$product}) {
                    $PALINDROMES{$product} = {
                        value => $product, 
                        factors => []
                    }
                }
                
                push @{ $PALINDROMES{$product}{factors} }, [$x, $y];
                $PALINDROMES{$product}{value} = $product;
            }
        }
    }

    return \%PALINDROMES;
}

1;
