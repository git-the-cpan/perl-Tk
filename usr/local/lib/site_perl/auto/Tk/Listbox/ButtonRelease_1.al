package Tk::Listbox;
sub ButtonRelease_1{my$w=shift;
my$Ev=$w->XEvent;
$w->CancelRepeat;
$w->activate($Ev->xy);}1;
