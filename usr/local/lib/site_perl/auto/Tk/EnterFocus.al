package Tk;
sub EnterFocus{my$w=shift;
my$Ev=$w->XEvent;
my$d=$Ev->d;
$w->Tk::focus()if($d eq 'NotifyAncestor'||$d eq 'NotifyNonlinear'||$d eq 'NotifyInferior');}1;
