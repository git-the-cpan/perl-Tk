package Tk::Toplevel;
sub FG_BindOut{my($t,$w,$cmd)=@_;
$t->Error("focus group \"$t\" doesn't exist")unless(exists$t->{'_fg'});
$t->{'_FocusOut'}{$w}=Tk::Callback->new($cmd);}1;
