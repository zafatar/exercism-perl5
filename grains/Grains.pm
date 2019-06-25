package Grains;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(grains_on_square total_grains);

my $MIN_NO_OF_SQUARES = 1;
my $MAX_NO_OF_SQUARES = 64;

sub grains_on_square {
  my ($square) = @_;
  die "square must be between $MIN_NO_OF_SQUARES and $MAX_NO_OF_SQUARES" 
    if ($square < $MIN_NO_OF_SQUARES || $square > $MAX_NO_OF_SQUARES);
    
  return 1 if $square == $MIN_NO_OF_SQUARES;

  return 2 * grains_on_square($square-1);
}

sub total_grains {
  my $sum = 0;
  my $curr = 0;

  for ($MIN_NO_OF_SQUARES..$MAX_NO_OF_SQUARES) {
    if ($_ == $MIN_NO_OF_SQUARES) {
      $curr = 1;
    }
    else {
      $curr = 2 * $curr;
      $sum += $curr;
    }
  }

  return $sum;
}

1;
