package Tk::Listbox;
sub SetList{my$w=shift;
$w->delete(0,'end');
$w->insert('end',@_);}1;
