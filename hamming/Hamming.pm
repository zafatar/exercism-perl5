package Hamming;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(hamming_distance);

sub hamming_distance {
  my ( $strand1, $strand2 ) = @_;

  die "left and right strands must be of equal length" if length($strand1) != length($strand2);

  my @strand1_arr = split("", $strand1);
  my @strand2_arr = split("", $strand2);

  my @diff_index = grep { $strand1_arr[$_] ne $strand2_arr[$_] } 0..@strand1_arr-1;
  
  return scalar(@diff_index);
}

1;
