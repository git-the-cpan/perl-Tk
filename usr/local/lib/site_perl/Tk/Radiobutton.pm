package Tk::Radiobutton;
use vars qw($VERSION);
$VERSION = '3.013'; # $Id: //depot/Tk8/Tk/Radiobutton.pm#13 $
require Tk::Button;
use base  qw(Tk::Button);
Construct Tk::Widget 'Radiobutton';
sub Tk_cmd{\&Tk::radiobutton}sub CreateOptions{return(shift->SUPER::CreateOptions,'-variable');}sub ClassInit{my($class,$mw)=@_;
$mw->bind($class,'<Enter>','Enter');
$mw->bind($class,'<Leave>','Leave');
$mw->bind($class,'<1>','Invoke');
$mw->bind($class,'<space>','Invoke');
return$class;}sub Invoke{my$w=shift;
$w->invoke()unless($w->cget('-state')eq 'disabled');}1;
