package Tk::Toplevel;
sub FG_Out{my($t,$w,$detail)=@_;
if($detail ne 'NotifyNonlinear' and$detail ne 'NotifyNonlinearVirtual'){return;}unless(exists$t->{'_FocusOut'}{$w}){return;}else{$t->{'_FocusOut'}{$w}->Call;
delete$t->{'_focus'};}}1;
__END__
1;
# end of Tk::Toplevel::FG_Out
