package Tk::Frame;
sub scrollbars{my($cw,$opt)=@_;
my$var=\$cw->{'-scrollbars'};
if(@_>1){my$old=$$var;
if(!defined$old||$old ne$opt){$$var=$opt;
$cw->queuePack;}}return$$var;}1;
