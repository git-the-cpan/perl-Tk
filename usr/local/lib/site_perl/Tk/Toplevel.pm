package Tk::Toplevel;
use AutoLoader;
use vars qw($VERSION);
$VERSION = '3.028'; # $Id: //depot/Tk8/Tk/Toplevel.pm#28 $
use base  qw(Tk::Wm Tk::Frame);
Construct Tk::Widget 'Toplevel';
sub Tk_cmd{\&Tk::toplevel}sub CreateOptions{return(shift->SUPER::CreateOptions,'-screen','-use')}sub Populate{my($cw,$arg)=@_;
$cw->SUPER::Populate($arg);
$cw->ConfigSpecs('-title',['METHOD',undef,undef,$cw->class]);}sub Icon{my($top,%args)=@_;
my$icon=$top->iconwindow;
my$state=$top->state;
if($state ne 'withdrawn'){$top->withdraw;
$top->update;}unless(defined$icon){$icon=Tk::Toplevel->new($top,'-borderwidth'=>0,'-class'=>'Icon');
$icon->withdraw;
my$lab=$icon->Component('Label'=>'icon');
$lab->pack('-expand'=>1,'-fill'=>'both');
$icon->ConfigSpecs(DEFAULT=>['DESCENDANTS']);
$icon->ConfigDefault(\%args);
$top->iconwindow($icon);
$top->update;
$lab->DisableButtonEvents;
$lab->update;}$top->iconimage($args{'-image'})if(exists$args{'-image'});
$icon->configure(%args);
$icon->idletasks;
$icon->geometry($icon->ReqWidth.'x'.$icon->ReqHeight);
$icon->update;
$top->deiconify if($state eq 'normal');
$top->iconify   if($state eq 'iconic');}sub menu{my$w=shift;
my$menu;
$menu=$w->cget('-menu');
unless(defined$menu){$w->configure(-menu=>($menu=$w->SUPER::menu))}$menu->configure(@_)if@_;
return$menu;}1;
__END__
sub FG_Create{my$t=shift;
unless(exists$t->{'_fg'}){$t->{'_fg'}=1;
$t->bind('<FocusIn>',sub{my$w=shift;
my$Ev=$w->XEvent;
$t->FG_In($w,$Ev->d);});
$t->bind('<FocusOut>',sub{my$w=shift;
my$Ev=$w->XEvent;
$t->FG_Out($w,$Ev->d);});
$t->bind('<Destroy>',sub{my$w=shift;
my$Ev=$w->XEvent;
$t->FG_Destroy($w);});
$t->OnDestroy([$t,'FG_Destroy']);}}sub FG_BindIn{my($t,$w,$cmd)=@_;
$t->Error("focus group \"$t\" doesn't exist")unless(exists$t->{'_fg'});
$t->{'_FocusIn'}{$w}=Tk::Callback->new($cmd);}sub FG_BindOut{my($t,$w,$cmd)=@_;
$t->Error("focus group \"$t\" doesn't exist")unless(exists$t->{'_fg'});
$t->{'_FocusOut'}{$w}=Tk::Callback->new($cmd);}sub FG_Destroy{my($t,$w)=@_;
if(!defined($w)||$t==$w){delete$t->{'_fg'};
delete$t->{'_focus'};
delete$t->{'_FocusOut'};
delete$t->{'_FocusIn'};}else{if(exists$t->{'_focus'}){delete$t->{'_focus'}if($t->{'_focus'}==$w);}delete$t->{'_FocusIn'}{$w};
delete$t->{'_FocusOut'}{$w};}}sub FG_In{my($t,$w,$detail)=@_;
if(defined$t->{'_focus'}and$t->{'_focus'}eq$w){return;}else{$t->{'_focus'}=$w;
$t->{'_FocusIn'}{$w}->Call if exists$t->{'_FocusIn'}{$w};}}sub FG_Out{my($t,$w,$detail)=@_;
if($detail ne 'NotifyNonlinear' and$detail ne 'NotifyNonlinearVirtual'){return;}unless(exists$t->{'_FocusOut'}{$w}){return;}else{$t->{'_FocusOut'}{$w}->Call;
delete$t->{'_focus'};}}1;
__END__