package Tk::Listbox;
sub Cntrl_Home{my$w=shift;
my$Ev=$w->XEvent;
$w->activate(0);
$w->see(0);
$w->selectionClear(0,'end');
$w->selectionSet(0)}1;
