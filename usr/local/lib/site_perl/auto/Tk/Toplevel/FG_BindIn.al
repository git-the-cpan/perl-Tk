package Tk::Toplevel;
sub FG_BindIn{my($t,$w,$cmd)=@_;
$t->Error("focus group \"$t\" doesn't exist")unless(exists$t->{'_fg'});
$t->{'_FocusIn'}{$w}=Tk::Callback->new($cmd);}1;
