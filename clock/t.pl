#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use Clock ();

my $c = Clock->new({'hour' => 10, 'minute' => 0});

$c->add_minutes(3);

my $t = $c->time();

print($t . "\n");
