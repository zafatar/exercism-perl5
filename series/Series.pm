package Series;
use strict;
use warnings;
use Exporter 'import';

sub new {
    my $class = shift;
    my $self = {
        input => shift,
    };

    bless $self, $class;
    return $self;
}

sub slice {
    my ($self, $size) = @_;
    # my $ret = [];

    die "ArgumentError" if $size > length($self->{input});

    my @elements = split('', $self->{input});

    my @ret = map {
        [ @elements[ $_ .. $_ + $size - 1] ]
    }  0 .. @elements - $size;

    return \@ret;
} 

1;
