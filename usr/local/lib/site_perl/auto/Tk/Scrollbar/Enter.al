package Tk::Scrollbar;
sub Enter{my$w=shift;
my$e=$w->XEvent;
if($Tk::strictMotif){my$bg=$w->cget('-background');
$activeBg=$w->cget('-activebackground');
$w->configure('-activebackground'=>$bg);}$w->activate($w->identify($e->x,$e->y));}1;
