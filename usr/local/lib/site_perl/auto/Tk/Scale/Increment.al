package Tk::Scale;
sub Increment{my$w=shift;
my$dir=shift;
my$big=shift;
my$repeat=shift;
my$inc;
if($big eq 'big'){$inc=$w->cget('-bigincrement');
if($inc==0){$inc=abs(($w->cget('-to')-$w->cget('-from')))/10.0}if($inc<$w->cget('-resolution')){$inc=$w->cget('-resolution')}}else{$inc=$w->cget('-resolution')}if(($w->cget('-from')>$w->cget('-to'))^($dir eq 'up')){$inc=-$inc}$w->set($w->get()+$inc);
if($repeat eq 'again'){$w->RepeatId($w->after($w->cget('-repeatinterval'),'Increment',$w,$dir,$big,'again'));}elsif($repeat eq 'initial'){$w->RepeatId($w->after($w->cget('-repeatdelay'),'Increment',$w,$dir,$big,'again'));}}1;
