package Tk::Scale;
sub Leave{my($w)=@_;
$w->configure('-activebackground',$w->{'activeBg'})if($Tk::strictMotif);
$w->configure('-state','normal')if($w->cget('-state')eq 'active');}1;
