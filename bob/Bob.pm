# Declare package 'Bob'
package Bob;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(hey);

sub hey {
  my ($msg) = @_;
  my $answer = "Whatever.";

  # Cleaning
  $msg =~ s/^\s*|\s*$//gsi;         # clean leading and trailing spaces.
  $msg =~ s/[\r\n\t\s]//gsi;        # remove the other whitespaces.

  $answer = "Fine. Be that way!" if $msg =~ /^\s*$/gs;
  $answer = "Sure." if $msg =~ /\?$/gs;
  $answer = "Whoa, chill out!" if $msg =~ /[A-Z]/gs && $msg eq uc($msg);
  $answer = "Calm down, I know what I'm doing!" if $msg =~ /[A-Z]/gs && $msg eq uc($msg) && $msg =~ /\?$/gs;

  return $answer;
}

1;
