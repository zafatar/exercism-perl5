package Squares;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(sum_of_squares square_of_sum difference);

sub new {
    my $class = shift;
    my $self = {
        n => shift
    };

    bless($self, $class);
    return $self;
}

sub square_of_sum {
    my ($self) = @_;
    my $sum = $self->{n} * ($self->{n} + 1) / 2;

    return $sum * $sum;
}

sub sum_of_squares {
    my ($self) = @_;

    my $sum = 0;
    $sum += $_ * $_ for 1 .. $self->{n}; 

    return $sum;
}

sub difference {    
    my ($self) = @_;
    
    return $self->square_of_sum() - $self->sum_of_squares();
}

1;
