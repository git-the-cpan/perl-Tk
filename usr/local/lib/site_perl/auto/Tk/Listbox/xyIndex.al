package Tk::Listbox;
sub xyIndex{my$w=shift;
my$Ev=$w->XEvent;
return$w->index($Ev->xy);}1;
