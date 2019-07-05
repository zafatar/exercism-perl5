package Clock;

sub new {
  my ( $class, $self ) = @_;
  bless $self, $class;

  $self->_normalize_time();

  return $self;
}

sub time {
  my ($self) = @_;
  return sprintf("%02s:%02s", $self->{hour}, $self->{minute});
}

sub add_minutes {
  my ( $self, $amount ) = @_;
  $self->{minute} = $self->{minute} + $amount;
 
  $self->_normalize_time();

  return $self;
}

sub subtract_minutes {
  my ( $self, $amount ) = @_;
  $self->{minute} = $self->{minute} - $amount;
  
  $self->_normalize_time();

  return $self;
}

sub _total_time_in_minutes {
  my ($self) = @_;
  return $self->{hour} * 60 + $self->{minute};
}

sub _normalize_time {
  my ($self) = @_;
  my $total_time =  $self->_total_time_in_minutes;

  my $normalized_minute = $total_time % 60;
  my $normalized_hour = ($total_time - $normalized_minute) / 60;
  $normalized_hour = $normalized_hour % 24;

  $self->{hour} = $normalized_hour;
  $self->{minute} = $normalized_minute;
}

1;
