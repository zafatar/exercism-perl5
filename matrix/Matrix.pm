package Matrix;
use strict;
use warnings;
use Exporter 'import';

sub new {
    my ($class, $matrix_as_string) = @_;

    my $self = {
        "cells" => [ 
                    map { 
                        [split]                     # col splitting
                    } 
                    split('\n', $matrix_as_string)  # row splitting
                ]      
    };

    bless $self, $class;
    return $self;
}

sub rows {
    my ($self, $row_number) = @_;
    return $self->{"cells"}->[$row_number];
}

sub columns {
    my ($self, $col_number) = @_;
    return [ map{ $_->[$col_number] } @{$self->{"cells"}} ];
}

1;