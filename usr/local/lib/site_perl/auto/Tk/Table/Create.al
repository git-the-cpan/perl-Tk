package Tk::Table;
sub Create{my$t=shift;
my$r=shift;
my$c=shift;
my$kind=shift;
$t->put($r,$c,$t->$kind(@_));}1;
