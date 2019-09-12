#!/usr/bin/env perl
use strict;
use warnings;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use Data::Dumper;
use RobotName; 

my $r = RobotName->new;

my $m = $r->name;

print Dumper($m);
