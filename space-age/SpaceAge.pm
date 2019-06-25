package SpaceAge;
use strict;
use warnings;

my $EARTH_YEAR_IN_SECONDS = 31_557_600;

my %ORBITAL_PERIODS = (
    "Earth"   => 1          * $EARTH_YEAR_IN_SECONDS, 
    "Mercury" => 0.2408467  * $EARTH_YEAR_IN_SECONDS,
    "Venus"   => 0.61519726 * $EARTH_YEAR_IN_SECONDS,
    "Mars"    => 1.8808158  * $EARTH_YEAR_IN_SECONDS,
    "Jupiter" => 11.862615  * $EARTH_YEAR_IN_SECONDS,
    "Saturn"  => 29.447498  * $EARTH_YEAR_IN_SECONDS,
    "Uranus"  => 84.016846  * $EARTH_YEAR_IN_SECONDS,
    "Neptune" => 164.79132  * $EARTH_YEAR_IN_SECONDS,
);

sub new {
    my $class = shift;
    my $self = {
        seconds => shift
    };

    bless($self, $class);
    return $self;
}

sub seconds { shift->{seconds} }

sub on_earth   { shift->calculate_year_on('Earth')   }
sub on_mercury { shift->calculate_year_on('Mercury') }
sub on_venus   { shift->calculate_year_on('Venus')   }
sub on_mars    { shift->calculate_year_on('Mars')    }
sub on_jupiter { shift->calculate_year_on('Jupiter') }
sub on_saturn  { shift->calculate_year_on('Saturn')  }
sub on_uranus  { shift->calculate_year_on('Uranus')  }
sub on_neptune { shift->calculate_year_on('Neptune') }

sub calculate_year_on {
    my ($self, $planet) = @_;
    return sprintf("%.2f", $self->seconds / $ORBITAL_PERIODS{$planet});
}