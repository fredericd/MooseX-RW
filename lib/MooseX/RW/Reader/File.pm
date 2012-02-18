package MooseX::RW::Reader::File;
# ABSTRACT: A Moose::Role file reader

use Moose::Role;
use Carp;

with 'MooseX::RW::Reader';



=attr file

Name of the file into which read something.  A error is thrown if the file
does't exist. Setting this attribute will set L<fh> attribute.

=cut

has file => (
    is => 'rw',
    isa => 'Str',
    trigger => sub {
        my ($self, $file) = @_;
        unless ( -e $file ) {
            croak "File doesn't exist: " . $file;
        }
        $self->{file} = $file;
        open my $fh, '<',$self->file
             or croak "Impossible to open file: " . $self->file;
        $self->fh($fh);
    },
);


=attr fh

File handle form which writing.

=cut

has fh => ( is => 'rw' );



=cut

=method percentage

Returns the percentage of the file which has been read, with 2 decimals.

=cut

sub percentage {
    my $self = shift;
    my (undef, undef, undef, undef, undef, undef, undef, $size) =
      $self->fh->stat;
    my $p = ($self->fh->tell * 100) / $size;
    return sprintf("%.2f", $p);
}



1;

