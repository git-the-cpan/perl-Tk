package Tk::Checkbutton;
use vars qw($VERSION);
$VERSION = '3.011'; # $Id: //depot/Tk8/Tk/Checkbutton.pm#11 $
require Tk::Widget;
require Tk::Button;
use base  qw(Tk::Button);
Construct Tk::Widget 'Checkbutton';
sub Tk_cmd{\&Tk::checkbutton}sub ClassInit{my($class,$mw)=@_;
$mw->bind($class,'<Enter>','Enter');
$mw->bind($class,'<Leave>','Leave');
$mw->bind($class,'<1>','Invoke');
$mw->bind($class,'<space>','Invoke');
return$class;}sub Invoke{my$w=shift;
$w->invoke()unless($w->cget('-state')eq 'disabled');}1;
