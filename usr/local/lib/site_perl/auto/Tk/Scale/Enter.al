package Tk::Scale;
sub Enter{my($w,$x,$y)=@_;
if($Tk::strictMotif){$w->{'activeBg'}=$w->cget('-activebackground');
$w->configure('-activebackground',$w->cget('-background'));}$w->Activate($x,$y);}1;
