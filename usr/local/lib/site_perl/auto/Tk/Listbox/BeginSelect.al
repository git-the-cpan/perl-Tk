package Tk::Listbox;
sub BeginSelect{my$w=shift;
my$el=shift;
if($w->cget('-selectmode')eq 'multiple'){if($w->selectionIncludes($el)){$w->selectionClear($el)}else{$w->selectionSet($el)}}else{$w->selectionClear(0,'end');
$w->selectionSet($el);
$w->selectionAnchor($el);
@Selection=();
$Prev=$el}$w->focus if($w->cget('-takefocus'));}1;
