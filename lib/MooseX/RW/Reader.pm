package MooseX::RW::Reader;
# ABSTRACT: Moose::Role reader

use Moose::Role;

with 'MooseX::RW';

requires 'read';

=method read

Required method to read anything.

=cut

sub read {
    my $self = shift;
    $self->count($self->count + 1);
}


1;
