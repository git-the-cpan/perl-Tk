package Tk::Listbox;
sub BeginToggle{my$w=shift;
my$el=shift;
if($w->cget('-selectmode')eq 'extended'){@Selection=$w->curselection();
$Prev=$el;
$w->selectionAnchor($el);
if($w->selectionIncludes($el)){$w->selectionClear($el)}else{$w->selectionSet($el)}}}1;
