package RomanNumerals;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(to_roman);

my %LETTERS = (
  1    => "I", 
  5    => "V",
  10   => "X",
  50   => "L", 
  100  => "C", 
  500  => "D", 
  1000 => "M" 
);

sub to_roman {
  my ($number) = @_;
  my $roman_number = "";

  return "Not possible" if $number > 3000;

  my %elements = _decompose_number($number);

  foreach my $step (reverse sort keys %elements) {
    my $coefficient = $elements{$step};

    my $r = join("", ($LETTERS{$step}) x $coefficient);   # default is N times Letters. 

    if ( ($coefficient == 1 || $coefficient == 5) && exists $LETTERS{$coefficient * $step}) {
      $r = $LETTERS{$coefficient * $step};
    }
    elsif ($coefficient == 2 || $coefficient == 3) {
      $r = join("", ($LETTERS{$step}) x $coefficient);
    }
    elsif ($coefficient == 4) {
      $r = $LETTERS{$step} . $LETTERS{5 * $step}
    }
    elsif ($coefficient == 6 || $coefficient == 7 || $coefficient == 8 ) {
      $r = $LETTERS{5 * $step} . join("", ($LETTERS{$step}) x ($coefficient - 5)); 
    }
    elsif ($coefficient == 9) {
      $r = $LETTERS{$step} . $LETTERS{10 * $step}
    }

    $roman_number .= $r;
  }

  return $roman_number;
}

sub _decompose_number {
  my ($number) = @_;
  my @digits = reverse(split("", $number));
  my %break_down = ();
  
  for (0..scalar(@digits)-1) {
     $break_down{10 ** $_} = $digits[$_];
  }

  return %break_down;
}

1;
