package Tk::Frame;
sub queuePack{my($cw)=@_;
unless($cw->{'pack_pending'}){$cw->{'pack_pending'}=1;
$cw->afterIdle([$cw,'packscrollbars']);}}1;
