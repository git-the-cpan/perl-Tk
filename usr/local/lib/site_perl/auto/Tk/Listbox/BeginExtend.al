package Tk::Listbox;
sub BeginExtend{my$w=shift;
my$el=shift;
if($w->cget('-selectmode')eq 'extended'&&$w->selectionIncludes('anchor')){$w->Motion($el)}}1;
