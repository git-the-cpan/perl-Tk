package Tk::Listbox;
sub UpDown{my$w=shift;
my$amount=shift;
$w->activate($w->index('active')+$amount);
$w->see('active');
$LNet__0=$w->cget('-selectmode');
if($LNet__0 eq 'browse'){$w->selectionClear(0,'end');
$w->selectionSet('active')}elsif($LNet__0 eq 'extended'){$w->selectionClear(0,'end');
$w->selectionSet('active');
$w->selectionAnchor('active');
$Prev=$w->index('active');
@Selection=();}}1;
