package Tk::Listbox;
sub DataExtend{my$w=shift;
my$el=shift;
$mode=$w->cget('-selectmode');
if($mode eq 'extended'){$w->activate($el);
$w->see($el);
if($w->selectionIncludes('anchor')){$w->Motion($el)}}elsif($mode eq 'multiple'){$w->activate($el);
$w->see($el)}}1;
