package Tk;
sub TraverseToMenu{my$w=shift;
my$char=shift;
return unless(defined$char&&$char ne '');
$w=$w->toplevel->FindMenu($char);}1;
