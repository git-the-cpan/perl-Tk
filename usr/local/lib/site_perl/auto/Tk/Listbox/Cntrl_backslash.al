package Tk::Listbox;
sub Cntrl_backslash{my$w=shift;
my$Ev=$w->XEvent;
if($w->cget('-selectmode')ne 'browse'){$w->selectionClear(0,'end');}}1;
