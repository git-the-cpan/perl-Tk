package Tk;
sub focusNext{my$w=shift;
my$cur=$w;
while(1){my$parent=$cur;
my@children=$cur->FocusChildren();
my$i=-1;
while(1){$i+=1;
if($i<@children){$cur=$children[$i];
next if($cur->toplevel==$cur);
last}$cur=$parent;
last if($cur->toplevel()==$cur);
$parent=$parent->parent();
@children=$parent->FocusChildren();
$i=lsearch(\@children,$cur);}if($cur==$w||$cur->FocusOK){$cur->tabFocus;
return;}}}1;
