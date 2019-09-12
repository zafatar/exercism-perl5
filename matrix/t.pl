#!/usr/bin/env perl
use strict;
use warnings;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use Data::Dumper;
use Matrix; 

my $m = Matrix->new("89 1903 3\n18 3 1\n9 4 800")->columns(1);

print Dumper($m);
