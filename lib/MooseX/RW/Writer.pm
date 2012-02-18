package MooseX::RW::Writer;
# ABSTRACT: Generic Moose::Role writer 

use Moose::Role;

with 'MooseX::RW';

requires 'write';


=method write

Required method to write anything.

=cut

sub write {
    my $self = shift;
    $self->count($self->count + 1);
}


1;
