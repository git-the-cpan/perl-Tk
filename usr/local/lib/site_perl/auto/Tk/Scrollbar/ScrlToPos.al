package Tk::Scrollbar;
sub ScrlToPos{my$w=shift;
my$pos=shift;
my$cmd=$w->cget('-command');
return unless(defined$cmd);
my@info=$w->get;
if(@info==2){$cmd->Call('moveto',$pos);}else{$cmd->Call(int($info[0]*$pos));}}1;
