package ScrabbleScore;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(score);

my %MAP = (
   1 => 'AEIOULNRST',
   2 => 'DG',
   3 => 'BCMP',
   4 => 'FHVWY',
   5 => 'K',
   8 => 'JX',
  10 => 'QZ'
);

my %LETTERS = map {
  my $value = $_;
  map { $_ => $value } split '', $MAP{$value} 
} keys %MAP;

sub score {
  my ( $word, %extensions ) = @_;
  my $score = 0; 

  $score += $LETTERS{$_} for ( grep { /[A-Z]/ } split('', uc($word)) );

  return $score;
}

1;
