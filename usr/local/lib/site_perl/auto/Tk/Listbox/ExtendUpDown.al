package Tk::Listbox;
sub ExtendUpDown{my$w=shift;
my$amount=shift;
if($w->cget('-selectmode')ne 'extended'){return;}$w->activate($w->index('active')+$amount);
$w->see('active');
$w->Motion($w->index('active'))}1;
