package Tk::Listbox;
sub SelectAll{my$w=shift;
my$mode=$w->cget('-selectmode');
if($mode eq 'single'||$mode eq 'browse'){$w->selectionClear(0,'end');
$w->selectionSet('active')}else{$w->selectionSet(0,'end')}}1;
