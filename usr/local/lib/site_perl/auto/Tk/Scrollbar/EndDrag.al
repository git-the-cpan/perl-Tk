package Tk::Scrollbar;
sub EndDrag{my$w=shift;
my$x=shift;
my$y=shift;
return unless defined($initMouse);
if($w->cget('-jump')){$w->ScrlToPos($initPos+$w->fraction($x,$y)-$initMouse);}undef$initMouse;}1;
