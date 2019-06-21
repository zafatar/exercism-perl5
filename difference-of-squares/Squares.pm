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
    my $sum = 0;

    for (my $i=1; $i <= $self->{n}; $i++) {
        $sum += $i;
    }

    return $sum * $sum;
}

sub sum_of_squares {
    my ($self) = @_;

    my $sum = 0;

    for (my $i=1; $i <= $self->{n}; $i++) {
        $sum += $i * $i;
    }

    return $sum;
}

sub difference {    
    my ($self) = @_;
    
    return $self->square_of_sum() - $self->sum_of_squares();
}