package Tk;
sub Error{my$w=shift;
my$error=shift;
if(Exists($w)){my$grab=$w->grab('current');
$grab->Unbusy if(defined$grab);}chomp($error);
warn"Tk::Error: $error\n ".join("\n ",@_)."\n";}1;
