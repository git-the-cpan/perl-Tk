package Tk::Listbox;
sub Cancel{my$w=shift;
if($w->cget('-selectmode')ne 'extended'||!defined$Prev){return;}$first=$w->index('anchor');
$last=$Prev;
if($first>$last){$tmp=$first;
$first=$last;
$last=$tmp}$w->selectionClear($first,$last);
while($first<=$last){if(Tk::lsearch(\@Selection,$first)>=0){$w->selectionSet($first)}$first+=1}}1;
