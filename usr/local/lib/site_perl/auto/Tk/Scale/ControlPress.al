package Tk::Scale;
sub ControlPress{my($w,$x,$y)=@_;
my$el=$w->identify($x,$y);
return unless($el);
if($el eq 'trough1'){$w->set($w->cget('-from'))}elsif($el eq 'trough2'){$w->set($w->cget('-to'))}}1;
