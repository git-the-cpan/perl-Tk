package Tk::Entry;
use vars qw($VERSION);
$VERSION = '3.037'; # $Id: //depot/Tk8/Entry/Entry.pm#37 $
use Tk::Widget();
use Tk::Clipboard();
use base  qw(Tk::Clipboard Tk::Widget);
import Tk qw(Ev $XS_VERSION);
Construct Tk::Widget 'Entry';
bootstrap Tk::Entry;
sub Tk_cmd{\&Tk::entry}Tk::Methods('bbox','delete','get','icursor','index','insert','scan','selection','xview');
use Tk::Submethods('selection'=>[qw(clear range adjust present to from)],'xview'=>[qw(moveto scroll)],);
sub wordstart{my($w,$pos)=@_;
my$string=$w->get;
$pos=$w->index('insert')-1 unless(defined$pos);
$string=substr($string,0,$pos);
$string=~s/\S*$//;
length$string;}sub wordend{my($w,$pos)=@_;
my$string=$w->get;
my$anc=length$string;
$pos=$w->index('insert')unless(defined$pos);
$string=substr($string,$pos);
$string=~s/^(?:((?=\s)\s*|(?=\S)\S*))//x;
$anc-length($string);}sub deltainsert{my($w,$d)=@_;
return$w->index('insert')+$d;}sub ClassInit{my($class,$mw)=@_;
$class->SUPER::ClassInit($mw);
$mw->bind($class,'<Escape>','selectionClear');
$mw->bind($class,'<1>',['Button1',Ev('x')]);
$mw->bind($class,'<B1-Motion>',['MouseSelect',Ev('x')]);
$mw->bind($class,'<Double-1>',['MouseSelect',Ev('x'),'word','sel.first']);
$mw->bind($class,'<Double-Shift-1>',['MouseSelect',Ev('x'),'word']);
$mw->bind($class,'<Triple-1>',['MouseSelect',Ev('x'),'line',0]);
$mw->bind($class,'<Triple-Shift-1>',['MouseSelect',Ev('x'),'line']);
$mw->bind($class,'<Shift-1>','Shift_1');
$mw->bind($class,'<B1-Leave>',['AutoScan',Ev('x')]);
$mw->bind($class,'<B1-Enter>','CancelRepeat');
$mw->bind($class,'<ButtonRelease-1>','CancelRepeat');
$mw->bind($class,'<Control-1>','Control_1');
$mw->bind($class,'<Left>',['SetCursor',Ev('deltainsert',-1)]);
$mw->bind($class,'<Right>',['SetCursor',Ev('deltainsert',1)]);
$mw->bind($class,'<Shift-Left>',['KeySelect',Ev('deltainsert',-1)]);
$mw->bind($class,'<Shift-Right>',['KeySelect',Ev('deltainsert',1)]);
$mw->bind($class,'<Control-Left>',['SetCursor',Ev(['wordstart'])]);
$mw->bind($class,'<Control-Right>',['SetCursor',Ev(['wordend'])]);
$mw->bind($class,'<Shift-Control-Left>',['KeySelect',Ev(['wordstart'])]);
$mw->bind($class,'<Shift-Control-Right>',['KeySelect',Ev(['wordend'])]);
$mw->bind($class,'<Home>',['SetCursor',0]);
$mw->bind($class,'<Shift-Home>',['KeySelect',0]);
$mw->bind($class,'<End>',['SetCursor','end']);
$mw->bind($class,'<Shift-End>',['KeySelect','end']);
$mw->bind($class,'<Delete>','Delete');
$mw->bind($class,'<BackSpace>','Backspace');
$mw->bind($class,'<Control-space>',['selectionFrom','insert']);
$mw->bind($class,'<Select>',['selectionFrom','insert']);
$mw->bind($class,'<Control-Shift-space>',['selectionAdjust','insert']);
$mw->bind($class,'<Shift-Select>',['selectionAdjust','insert']);
$mw->bind($class,'<Control-slash>',['selectionRange',0,'end']);
$mw->bind($class,'<Control-backslash>','selectionClear');
$mw->bind($class,'<KeyPress>',['Insert',Ev('A')]);
$mw->bind($class,'<Alt-KeyPress>','NoOp');
$mw->bind($class,'<Meta-KeyPress>','NoOp');
$mw->bind($class,'<Control-KeyPress>','NoOp');
$mw->bind($class,'<Return>','NoOp');
$mw->bind($class,'<KP_Enter>','NoOp');
$mw->bind($class,'<Tab>','NoOp');
$mw->bind($class,'<Insert>','InsertSelection');
if(!$Tk::strictMotif){$mw->bind($class,'<Control-a>',['SetCursor',0]);
$mw->bind($class,'<Control-b>',['SetCursor',Ev('deltainsert',-1)]);
$mw->bind($class,'<Control-d>',['delete','insert']);
$mw->bind($class,'<Control-e>',['SetCursor','end']);
$mw->bind($class,'<Control-f>',['SetCursor',Ev('deltainsert',1)]);
$mw->bind($class,'<Control-h>','Backspace');
$mw->bind($class,'<Control-k>',['delete','insert','end']);
$mw->bind($class,'<Control-t>','Transpose');
$mw->bind($class,'<Meta-b>',['SetCursor',Ev(['wordstart'])]);
$mw->bind($class,'<Meta-d>',['delete','insert',Ev(['wordend'])]);
$mw->bind($class,'<Meta-f>',['SetCursor',Ev(['wordend'])]);
$mw->bind($class,'<Meta-BackSpace>',['delete',Ev(['wordstart']),'insert']);
$mw->bind($class,'<Control-w>',['delete',Ev(['wordstart']),'insert']);
$mw->bind($class,'<2>','Button_2');
$mw->bind($class,'<B2-Motion>','B2_Motion');
$mw->bind($class,'<ButtonRelease-2>','ButtonRelease_2');}return$class;}sub Shift_1{my$w=shift;
my$Ev=$w->XEvent;
$Tk::selectMode='char';
$w->selectionAdjust('@'.$Ev->x)}sub Control_1{my$w=shift;
my$Ev=$w->XEvent;
$w->icursor('@'.$Ev->x)}sub Delete{my$w=shift;
if($w->selectionPresent){$w->deleteSelected}else{$w->delete('insert')}}sub InsertSelection{my$w=shift;
eval{local$SIG{__DIE__};$w->Insert($w->SelectionGet)}}sub Button_2{my$w=shift;
my$Ev=$w->XEvent;
$w->scan('mark',$Ev->x);
$Tk::x=$Ev->x;
$Tk::y=$Ev->y;
$Tk::mouseMoved=0}sub B2_Motion{my$w=shift;
my$Ev=$w->XEvent;
if(abs(($Ev->x-$Tk::x))>2){$Tk::mouseMoved=1}$w->scan('dragto',$Ev->x)}sub ButtonRelease_2{my$w=shift;
my$Ev=$w->XEvent;
if(!$Tk::mouseMoved){eval{local$SIG{__DIE__};
$w->insert('insert',$w->SelectionGet);
$w->SeeInsert;}}}sub Button1{my$w=shift;
my$x=shift;
$Tk::selectMode='char';
$Tk::mouseMoved=0;
$Tk::pressX=$x;
$w->icursor('@'.$x);
$w->selectionFrom('@'.$x);
$w->selectionClear;
if($w->cget('-state')eq 'normal'){$w->focus()}}sub MouseSelect{my$w=shift;
my$x=shift;
$Tk::selectMode=shift if(@_);
my$cur=$w->index('@'.$x);
return unless defined$cur;
my$anchor=$w->index('anchor');
return unless defined$anchor;
if(($cur!=$anchor)||(abs($Tk::pressX-$x)>=3)){$Tk::mouseMoved=1}my$mode=$Tk::selectMode;
return unless$mode;
if($mode eq 'char'){if($Tk::mouseMoved){if($cur<$anchor){$w->selectionTo($cur)}else{$w->selectionTo($cur+1)}}}elsif($mode eq 'word'){if($cur<$w->index('anchor')){$w->selectionRange($w->wordstart($cur),$w->wordend($anchor-1))}else{$w->selectionRange($w->wordstart($anchor),$w->wordend($cur))}}elsif($mode eq 'line'){$w->selectionRange(0,'end')}if(@_){my$ipos=shift;
eval{local$SIG{__DIE__};$w->icursor($ipos)};}$w->idletasks;}sub AutoScan{my$w=shift;
my$x=shift;
if($x>=$w->width){$w->xview('scroll',2,'units')}elsif($x<0){$w->xview('scroll',-2,'units')}else{return;}$w->MouseSelect($x);
$w->RepeatId($w->after(50,['AutoScan',$w,$x]))}sub KeySelect{my$w=shift;
my$new=shift;
if(!$w->selectionPresent){$w->selectionFrom('insert');
$w->selectionTo($new)}else{$w->selectionAdjust($new)}$w->icursor($new);
$w->SeeInsert;}sub Insert{my$w=shift;
my$s=shift;
return unless(defined$s&&$s ne '');
eval{local$SIG{__DIE__};
my$insert=$w->index('insert');
if($w->index('sel.first')<=$insert&&$w->index('sel.last')>=$insert){$w->deleteSelected}};
$w->insert('insert',$s);
$w->SeeInsert}sub Backspace{my$w=shift;
if($w->selectionPresent){$w->deleteSelected}else{my$x=$w->index('insert')-1;
$w->delete($x)if($x>=0);}}sub SeeInsert{my$w=shift;
my$c=$w->index('insert');
my$left=$w->index('@0');
if($left>$c){$w->xview($c);
return;}my$x=$w->width;
while($w->index('@'.$x)<=$c&&$left<$c){$left+=1;
$w->xview($left)}}sub SetCursor{my$w=shift;
my$pos=shift;
$w->icursor($pos);
$w->selectionClear;
$w->SeeInsert;}sub Transpose{my$w=shift;
my$i=$w->index('insert');
$i++ if($i<$w->index('end'));
my$first=$i-2;
return if($first<0);
my$str=$w->get;
my$new=substr($str,$i-1,1).substr($str,$first,1);
$w->delete($first,$i);
$w->insert('insert',$new);
$w->SeeInsert;}sub tabFocus{my$w=shift;
$w->selectionRange(0,'end');
$w->icursor('end');
$w->SUPER::tabFocus;}sub getSelected{my$w=shift;
return undef unless$w->selectionPresent;
my$str=$w->get;
my$show=$w->cget('-show');
$str=$show x length($str)if(defined$show);
my$s=$w->index('sel.first');
my$e=$w->index('sel.last');
return substr($str,$s,$e+1-$s);}1;
__END__


