package Tk::Toplevel;
sub FG_Destroy{my($t,$w)=@_;
if(!defined($w)||$t==$w){delete$t->{'_fg'};
delete$t->{'_focus'};
delete$t->{'_FocusOut'};
delete$t->{'_FocusIn'};}else{if(exists$t->{'_focus'}){delete$t->{'_focus'}if($t->{'_focus'}==$w);}delete$t->{'_FocusIn'}{$w};
delete$t->{'_FocusOut'}{$w};}}1;
