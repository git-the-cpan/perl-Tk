package Tk;
sub RepeatId{my($w,$id)=@_;
$w=$w->MainWindow;
$w->CancelRepeat;
$w->{_afterId_}=$id;}1;
