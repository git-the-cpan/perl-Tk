package Tk;
sub focusFollowsMouse{my$widget=shift;
$widget->bind('all','<Enter>','EnterFocus');}1;
