package Tk::Frame;
sub sbset{my($cw,$sb,$ref,@args)=@_;
$sb->set(@args);
$cw->queuePack if(@args==2&&$sb->Needed!=$$ref);}1;
