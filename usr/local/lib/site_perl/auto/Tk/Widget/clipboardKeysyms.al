package Tk::Widget;
sub clipboardKeysyms{my@class=();
my$mw=shift;
if(ref$mw){$mw=$mw->DelegateFor('bind');}else{push(@class,$mw);
$mw=shift;}if(@_){my$copy=shift;
$mw->Tk::bind(@class,"<$copy>",'clipboardCopy')if(defined$copy);}if(@_){my$cut=shift;
$mw->Tk::bind(@class,"<$cut>",'clipboardCut')if(defined$cut);}if(@_){my$paste=shift;
$mw->Tk::bind(@class,"<$paste>",'clipboardPaste')if(defined$paste);}}1;
