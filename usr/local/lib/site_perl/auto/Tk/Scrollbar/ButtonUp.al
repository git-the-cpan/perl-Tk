package Tk::Scrollbar;
sub ButtonUp{my$w=shift;
my$e=$w->XEvent;
$w->CancelRepeat;
$w->configure('-activerelief'=>'raised');
$w->EndDrag($e->x,$e->y);
$w->activate($w->identify($e->x,$e->y));}1;
