package Tk::Wm;
sub Post{my($w,$X,$Y)=@_;
$X=int($X);
$Y=int($Y);
$w->positionfrom('user');
$w->MoveToplevelWindow($X,$Y);
$w->deiconify;
$w->raise;}1;
