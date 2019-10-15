package Cipher;
use strict;
use warnings;
use Exporter 'import';
use Data::Dumper;

our @EXPORT_OK = qw(encode decode);

# Prepare the map with possible key elements and positions.
my $CIPHER_KEY = "abcdefghijklmnopqrstuvwxyz";
my $CIPHER_KEY_LEN = length $CIPHER_KEY;
my @CIPHER_KEY_LIST = split('', $CIPHER_KEY);

my $position = 0;
my %CIPHER_KEY_POS = map { $_ => $position++ } @CIPHER_KEY_LIST;

sub new {
    my $class = shift;
    my $self = {
        key => shift,
        key_map => undef
    };

    die "ArgumentError: exception UPPERCASE key" if $self->{key} =~ /^[A-Z]+$/;
    die "ArgumentError: exception numeric key"   if $self->{key} =~ /^[0-9]+$/;
    die "ArgumentError: exception blank key"     if $self->{key} =~ /^\s*$/;

    $self->{key_map} = [map { $CIPHER_KEY_POS{$_} } split('', $self->{key})];

    bless($self, $class);
    return $self;
}

sub decode {
    my ($self, $input) = @_;
    return $self->_run('decode', $input);
} 

sub encode {
    my ($self, $input) = @_;
    return $self->_run('encode', $input);
}

sub _normalize {
    my $key = shift; 
    $key =~ s/[^a-z]//gi;
    return lc($key);
}

sub _run {
    my ($self, $type, $input) = @_;

    $input = _normalize($input);
    
    my $position = 0;
    my @encoded = map { 
        $CIPHER_KEY_LIST[ 
            (
                $type eq 'encode' ?  $CIPHER_KEY_POS{$_} + $self->{key_map}[ $position++ ] : 
                                     $CIPHER_KEY_POS{$_} - $self->{key_map}[ $position++ ]
            ) % $CIPHER_KEY_LEN 
        ] 
    } split('', $input);

    return join '', @encoded;
}

1;
