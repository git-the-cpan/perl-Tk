package Tk::Frame;
sub FindMenu{my($w,$char)=@_;
my$child;
my$match;
foreach$child($w->children){next unless(ref$child);
$match=$child->FindMenu($char);
return$match if(defined$match);}return undef;}1;
