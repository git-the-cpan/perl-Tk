package Tk::LabEntry;
use vars qw($VERSION);
$VERSION = '3.011'; # $Id: //depot/Tk8/Tk/LabEntry.pm#11 $
use base  qw(Tk::Frame);
use Tk::widgets qw(Frame Label Entry);
Construct Tk::Widget 'LabEntry';
sub Populate{require Tk::Entry;
my($cw,$args)=@_;
$cw->SUPER::Populate($args);
my$e=$cw->Entry();
$e->pack('-expand'=>1,'-fill'=>'both');
$cw->Advertise('entry'=>$e);
$cw->ConfigSpecs(DEFAULT=>[$e]);
$cw->Delegates(DEFAULT=>$e);
$cw->AddScrollbars($e)if(exists$args->{-scrollbars});}1;
