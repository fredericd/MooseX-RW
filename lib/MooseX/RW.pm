package MooseX::RW;
# ABSTRACT: Moose::Role reader/writer

use Moose::Role;

=attr count

Count of items/records which have been handled by reader/writer.

=cut

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

=head1 SYNOPSIS

Let suppose you have a voice box on you phone. You want to display all number
of your messages.

 package VoiceBox::Reader;
 
 use Moose;
 use Phone;
 
 with MooseX::RW::Reader;
 
 # VoIP phone
 has phone => ( is => 'rw', isa => 'Phone', required => 1 );
 
 sub read {
    my $self = shift;
    my $vb = $phone->voicebox;
    my $count = $self->count;
    return if $vb->count >= $count;
    my $msg = $phone->voicebox->get_msg($count);
    $self->count($count+1);
    return $msg;
 }
 
 package Main;
 
 my $phone = Phone->new( url => 'a.b.c.d' );
 my $reader = VoiceBox::Reader->new( phone => $phone );
 while ( $msg = $reader->read() ) {
    say $msg->count, ": ", $msg->from;
 }

=cut

1;
