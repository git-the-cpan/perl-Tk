package Tk::DragDrop::KDESite;
use strict;
use vars qw($VERSION);
$VERSION = '3.007'; # $Id: //depot/Tk8/DragDrop/DragDrop/KDESite.pm#7 $
use base qw(Tk::DropSite);
Tk::DropSite->Type('KDE');
sub InitSite{my($class,$site)=@_;
my$w=$site->widget;
$w->BindClientMessage('DndProtocol',[\&KDEDrop,$site]);}sub HandleLoose{my($w,$seln)=@_;
return '';}sub HandleData{my($string,$offset,$max)=@_;
return substr($string,$offset,$max);}sub KDEDrop{my($w,$site)=@_;
my$event=$w->XEvent;
my($type,$time,$flags,$X,$Y)=unpack('LLLLL',$event->A);
my@data=$w->property('get','DndSelection','root');
if($type==128&&@data==1&&$data[0]=~/^file:(.*)$/){my$seln='XdndSelection';
$w->SelectionHandle('-selection'=>$seln,-type=>'FILE_NAME',[\&HandleData,"$1"]);
$w->SelectionOwn('-selection'=>$seln,-command=>[\&HandleLoose,$w,$seln]);
$site->Apply(-dropcommand=>$Y,$Y,$seln);}else{print join(' ',$type,$time,$flags,$X,$Y),':"',join(',',@data),'"',"\n";}}1;
__END__
