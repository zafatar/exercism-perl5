package TwoFer;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(two_fer);

sub two_fer {
  my ($name) = @_;

  return sprintf("One for %s, one for me.", $name||"you")
}

1;
