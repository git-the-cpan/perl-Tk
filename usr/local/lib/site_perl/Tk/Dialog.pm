package Tk::Dialog;
use vars qw($VERSION);
$VERSION = '3.031'; # $Id: //depot/Tk8/Tk/Dialog.pm#31 $
use Carp;
use strict;
use base qw(Tk::DialogBox);
Construct Tk::Widget 'Dialog';
sub Populate{my($cw,$args)=@_;
$cw->SUPER::Populate($args);
my($w_bitmap,$w_but,$pad1,$pad2);
my(@pl)=(-side=>'top',-fill=>'both');
($pad1,$pad2)=([-padx=>'3m',-pady=>'3m'],[-padx=>'3m',-pady=>'2m']);
$cw->iconname('Dialog');
my$w_top=$cw->Subwidget('top');
@pl=(-side=>'left');
$w_bitmap=$w_top->Label(Name=>'bitmap');
$w_bitmap->pack(@pl,@$pad1);
my$w_msg=$w_top->Label(-wraplength=>'3i',-justify=>'left');
$w_msg->pack(-side=>'right',-expand=>1,-fill=>'both',@$pad1);
$cw->Advertise(message=>$w_msg);
$cw->Advertise(bitmap=>$w_bitmap);
$cw->ConfigSpecs(-image=>['bitmap',undef,undef,undef],-bitmap=>['bitmap',undef,undef,undef],-font=>['message','font','Font','-*-Times-Medium-R-Normal--*-180-*-*-*-*-*-*'],DEFAULT=>['message',undef,undef,undef]);}1;
__END__

=cut

