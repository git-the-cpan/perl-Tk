package Tk::Table;
sub Posn{my($t,$s)=@_;
my$info=$t->{Slave}{$s->PathName};
return(wantarray)?@$info:$info;}1;
