package Tk::Widget;
sub pathname{my($w,$id)=@_;
my$x=$w->winfo('pathname',-displayof=>oct($id));
return$x->PathName;}1;
