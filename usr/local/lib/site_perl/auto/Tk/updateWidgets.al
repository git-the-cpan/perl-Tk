package Tk;
sub updateWidgets{my($w)=@_;
while($w->DoOneEvent(DONT_WAIT|IDLE_EVENTS|WINDOW_EVENTS)){}$w;}1;
