package Raindrops;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(raindrop);

my %WORDS = (
  3 => "Pling", 
  5 => "Plang", 
  7 => "Plong"
);

sub raindrop {
  my ($number) = @_;
  my @factors = factorize_number($number);

  my @words = map { $WORDS{$_} || () } @factors;

  return (scalar(@words) > 0) ? join("", @words): $number;
}

sub factorize_number {
  my ($number) = @_;

  my @factors = grep { $number % $_ == 0 } sort { $a <=> $b } keys %WORDS;;

  return @factors;
}

1;
