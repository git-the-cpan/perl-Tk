package Tk;
sub Receive{my$w=shift;
warn 'Receive('.join(',',@_).')';
die 'Tk rejects send('.join(',',@_).")\n";}1;
