package Tk::LabRadiobutton;
use vars qw($VERSION);
$VERSION = '3.009'; # $Id: //depot/Tk8/Tk/LabRadio.pm#9 $
require Tk::Frame;
use base  qw(Tk::Frame);
Construct Tk::Widget 'LabRadiobutton';
sub CreateArgs{my($package,$parent,$args)=@_;
$parent->BackTrace("Must specify -radiobuttons for $package")unless(defined$args->{'-radiobuttons'});
return$package->SUPER::CreateArgs($parent,$args);}sub Populate{require Tk::Radiobutton;
my($cw,$args)=@_;
$cw->SUPER::Populate($args);
my(@widgets)=();
my$rl;
foreach$rl(@{$args->{'-radiobuttons'}}){my$r=$cw->Component(Radiobutton=>$rl,-text=>$rl,-value=>$rl);
$r->pack(-side=>'left',-expand=>1,-fill=>'both');
push(@widgets,$r);
$cw->{Configure}{-value}=$rl;}$cw->BackTrace('No buttons')unless(@widgets);
$cw->ConfigSpecs('-variable'=>[\@widgets,undef,undef,\$cw->{Configure}{-value}],'-radiobuttons'=>['PASSIVE',undef,undef,undef],'-value'=>['PASSIVE',undef,undef,$cw->{Configure}{-value}],'DEFAULT'=>[\@widgets]);}1;
