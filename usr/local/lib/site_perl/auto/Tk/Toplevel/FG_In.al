package Tk::Toplevel;
sub FG_In{my($t,$w,$detail)=@_;
if(defined$t->{'_focus'}and$t->{'_focus'}eq$w){return;}else{$t->{'_focus'}=$w;
$t->{'_FocusIn'}{$w}->Call if exists$t->{'_FocusIn'}{$w};}}1;
