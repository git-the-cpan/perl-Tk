package Tk::Scrollbar;
sub StartDrag{my$w=shift;
my$x=shift;
my$y=shift;
return unless(defined($w->cget('-command')));
$initMouse=$w->fraction($x,$y);
@initValues=$w->get();
if(@initValues==2){$initPos=$initValues[0];}else{$initPos=$initValues[2]/$initValues[0];}}1;
