package GradeSchool;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(roster);

sub roster {
  my ( $students, $grade ) = @_;
  
  return [ 
            map { $_->[0] }
            grep { !$grade || $_->[1] == $grade }
            sort { $a->[1] <=> $b->[1] ||               # by grade first, 
                   lc($a->[0]) cmp lc($b->[0])          # then by name.
                } 
            @$students 
        ];
}

1;