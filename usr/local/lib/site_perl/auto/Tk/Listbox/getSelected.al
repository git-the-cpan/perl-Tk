package Tk::Listbox;
sub getSelected{my($w)=@_;
my$i;
my(@result)=();
foreach$i($w->curselection){push(@result,$w->get($i));}return(wantarray)?@result:$result[0];}1;
__END__
1;
# end of Tk::Listbox::getSelected
