package Tk::Listbox;
sub Cntrl_End{my$w=shift;
my$Ev=$w->XEvent;
$w->activate('end');
$w->see('end');
$w->selectionClear(0,'end');
$w->selectionSet('end')}1;
