package Tk::Clipboard;
sub getSelected{my$w=shift;
my$val=Tk::catch{$w->get('sel.first','sel.last')};
return$val;}1;
