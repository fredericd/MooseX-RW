package MooseX::RW::Writer::File;
# ABSTRACT: A role for file writer

use Moose::Role;
use Carp;

with 'MooseX::RW::Writer';


=attr file

Name of the file into which write something. If the file already exist, it is
replaced. An error is thrown if the file can't be created. Setting this
attribute will set L<fh> attribute

=cut

has file => (
    is => 'rw',
    isa => 'Str',
    trigger => sub {
        my ($self, $file) = @_; 
        $self->{file} = $file;
        open my $fh, '>',$self->file
             or croak "Impossible to create file: " . $self->file;
        $self->fh($fh);
    }   
);


=attr fh

File handle form which writing.

=cut

has fh => ( is => 'rw' );


1;

