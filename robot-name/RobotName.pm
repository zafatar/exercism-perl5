package RobotName;
use strict;
use warnings;
use Exporter 'import';

my %ROBOTS = ();

my @CHARSET = 'A'..'Z';
my @NUMSET = 0..9;

sub new {
    my ($class) = @_;

    my $self = {
        "name" => _generate_name()
    };

    bless $self, $class;
    return $self;
}

sub name { shift->{name} }

sub reset_name {
    my $self = shift;

    while(1) {
        my $name = _generate_name();
        
        if(not exists $ROBOTS{$name}) {
            $self->{name} = $name;
            $ROBOTS{$name}++;
            last;
        }
    }

    return $self->name;
} 

sub _exists {
    my $name = shift;
    return $ROBOTS{$name};
}

sub _generate_name {
    return join '', (map $CHARSET[rand @CHARSET], 1..2), 
                    (map $NUMSET[rand @NUMSET], 1..3);
}

1;
