package Tk::Scale;
sub Drag{my$w=shift;
my$x=shift;
my$y=shift;
if(!$Tk::dragging){return;}$w->set($w->get($x-$Tk::deltaX,$y-$Tk::deltaY))}1;
