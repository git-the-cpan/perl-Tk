package Tk::Scrollbar;
sub ButtonDown{my$w=shift;
my$e=$w->XEvent;
my$element=$w->identify($e->x,$e->y);
$w->configure('-activerelief'=>'sunken');
if($e->b==1 and(defined($element)&&$element eq 'slider')){$w->StartDrag($e->x,$e->y);}elsif($e->b==2 and(defined($element)&&$element=~/^(trough[12]|slider)$/o)){my$pos=$w->fraction($e->x,$e->y);
my($head,$tail)=$w->get;
my$len=$tail-$head;
$head=$pos-$len/2;
$tail=$pos+$len/2;
if($head<0){$head=0;
$tail=$len;}elsif($tail>1){$head=1-$len;
$tail=1;}$w->ScrlToPos($head);
$w->set($head,$tail);
$w->StartDrag($e->x,$e->y);}else{$w->Select($element,'initial');}}1;
