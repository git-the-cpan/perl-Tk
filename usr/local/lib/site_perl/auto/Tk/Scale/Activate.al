package Tk::Scale;
sub Activate{my$w=shift;
my$x=shift;
my$y=shift;
return if($w->cget('-state')eq 'disabled');
my$ident=$w->identify($x,$y);
if(defined($ident)&&$ident eq 'slider'){$w->configure(-state=>'active')}else{$w->configure(-state=>'normal')}}1;
