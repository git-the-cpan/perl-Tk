package Tk::Scale;
sub ButtonUp{my($w,$x,$y)=@_;
$w->CancelRepeat();
$w->EndDrag();
$w->Activate($x,$y)}1;
