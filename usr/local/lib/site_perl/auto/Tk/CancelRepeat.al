package Tk;
sub CancelRepeat{my$w=shift->MainWindow;
my$id=delete$w->{_afterId_};
$w->after('cancel',$id)if(defined$id);}1;
