package Tk::Scrollbar;
sub ScrlTopBottom{my$w=shift;
my$e=$w->XEvent;
my$element=$w->identify($e->x,$e->y);
return unless($element);
if($element=~/1$/){$w->ScrlToPos(0);}elsif($element=~/2$/){$w->ScrlToPos(1);}}1;
