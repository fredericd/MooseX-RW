package MooseX::RW;
# ABSTRACT: Moose::Role reader/writer

use Moose::Role;

has count => (
    is => 'rw',
    isa => 'Int',
    default => 0,
);


=method begin

Not required method which could be called by a processor at the begining of a
process.

=cut

sub begin {}


=method end

Not required method which could be called by a processor at the end of a process.

=cut 

sub end {}


1;
