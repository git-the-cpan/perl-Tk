package Tk::Scrollbar;
sub Select{my$w=shift;
my$element=shift;
my$repeat=shift;
return unless defined($element);
if($element eq 'arrow1'){$w->ScrlByUnits('hv',-1);}elsif($element eq 'trough1'){$w->ScrlByPages('hv',-1);}elsif($element eq 'trough2'){$w->ScrlByPages('hv',1);}elsif($element eq 'arrow2'){$w->ScrlByUnits('hv',1);}else{return;}if($repeat eq 'again'){$w->RepeatId($w->after($w->cget('-repeatinterval'),['Select',$w,$element,'again']));}elsif($repeat eq 'initial'){$w->RepeatId($w->after($w->cget('-repeatdelay'),['Select',$w,$element,'again']));}}1;
