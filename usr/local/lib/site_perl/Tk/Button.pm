package Tk::Button;
use vars qw($VERSION);
$VERSION = '3.014'; # $Id: //depot/Tk8/Tk/Button.pm#14 $
use strict;
require Tk::Widget;
use base  qw(Tk::Widget);
use vars qw($buttonWindow $relief);
Tk::Methods('deselect','flash','invoke','select','toggle');
sub Tk_cmd{\&Tk::button}Construct Tk::Widget 'Button';
sub ClassInit{my($class,$mw)=@_;
$mw->bind($class,'<Enter>','Enter');
$mw->bind($class,'<Leave>','Leave');
$mw->bind($class,'<1>','butDown');
$mw->bind($class,'<ButtonRelease-1>','butUp');
$mw->bind($class,'<space>','Invoke');
$mw->bind($class,'<Return>','Invoke');
return$class;}sub Enter{my$w=shift;
my$E=shift;
if($w->cget('-state')ne 'disabled'){$w->configure('-state'=>'active');
$w->configure('-state'=>'active','-relief'=>'sunken')if(defined($buttonWindow)&&$w==$buttonWindow)}$Tk::window=$w;}sub Leave{my$w=shift;
$w->configure('-state'=>'normal')if($w->cget('-state')ne 'disabled');
$w->configure('-relief'=>$relief)if(defined($buttonWindow)&&$w==$buttonWindow);
undef$Tk::window;}sub butDown{my$w=shift;
$relief=$w->cget('-relief');
if($w->cget('-state')ne 'disabled'){$buttonWindow=$w;
$w->configure('-relief'=>'sunken')}}sub butUp{my$w=shift;
if(defined($buttonWindow)&&$buttonWindow==$w){undef$buttonWindow;
$w->configure('-relief'=>$relief);
if($w->IS($Tk::window)&&$w->cget('-state')ne 'disabled'){$w->invoke;}}}sub Invoke{my$w=shift;
if($w->cget('-state')ne 'disabled'){my$oldRelief=$w->cget('-relief');
my$oldState=$w->cget('-state');
$w->configure('-state'=>'active','-relief'=>'sunken');
$w->idletasks;
$w->after(100);
$w->configure('-state'=>$oldState,'-relief'=>$oldRelief);
$w->invoke;}}1;
__END__





