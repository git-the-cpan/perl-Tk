package Tk::Listbox;
sub AutoScan{my$w=shift;
my$x=shift;
my$y=shift;
if($y>=$w->height){$w->yview('scroll',1,'units')}elsif($y<0){$w->yview('scroll',-1,'units')}elsif($x>=$w->width){$w->xview('scroll',2,'units')}elsif($x<0){$w->xview('scroll',-2,'units')}else{return;}$w->Motion($w->index("@".$x.','.$y));
$w->RepeatId($w->after(50,'AutoScan',$w,$x,$y));}1;
