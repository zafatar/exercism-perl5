package BeerSong;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(sing);

my $MAX_NO_OF_BOTTLES = 99;

sub sing {
  my ($input) = @_;
  my @lyrics = (); 

  my $remaining = $input->{bottles};
  my $takedown = $input->{verses};

  if ($remaining > 0) {
    while($remaining >0 && $takedown > 0) {
      # remaining bottle results
      my $remaining_no_of_bottles = ($remaining > 1) ? "$remaining bottles" : "$remaining bottle"; 
      push @lyrics, "$remaining_no_of_bottles of beer on the wall, $remaining_no_of_bottles of beer.\n";

      $remaining--;

      # action to be taken - take one or it.
      my $take_one = ($remaining == 0) ? "it" : "one" ;
      
      $remaining_no_of_bottles = $remaining . " bottles" if $remaining > 1;
      $remaining_no_of_bottles = $remaining . " bottle"  if $remaining == 1;
      $remaining_no_of_bottles = "no more bottles"       if $remaining == 0; 

      push @lyrics, "Take $take_one down and pass it around, $remaining_no_of_bottles of beer on the wall.\n\n";
   
      $takedown--;
    }
  }

  if($remaining == 0 && $takedown > 0) {
    push @lyrics, "No more bottles of beer on the wall, no more bottles of beer.\n";
    push @lyrics, "Go to the store and buy some more, $MAX_NO_OF_BOTTLES bottles of beer on the wall.\n";
  }

  return join("", @lyrics);
}

1;
