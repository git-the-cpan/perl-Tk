package Tk;
sub Selection{my$widget=shift;
my$cmd=shift;
croak 'Use SelectionOwn/SelectionOwner' if($cmd eq 'own');
croak"Use Selection\u$cmd()";}1;
