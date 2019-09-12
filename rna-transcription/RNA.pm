package RNA;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(to_rna);

my %MAP = (
  "G" => "C",
  "C" => "G",
  "T" => "A",
  "A" => "U"
);

sub to_rna {
  my ($dna) = @_;
  return join '', map { $MAP{uc($_)} } split '', $dna;
}

1;
