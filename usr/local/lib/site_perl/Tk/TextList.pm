package Tk::TextList;
use strict;
use vars qw($VERSION);
$VERSION = '3.002'; # $Id: //depot/Tk8/TextList/TextList.pm#2 $
use Tk::Reindex qw(Tk::ROText ReindexedROText);
use base qw(Tk::Derived Tk::ReindexedROText );
use Tk qw (Ev);
use base qw(Tk::ReindexedROText);
Construct Tk::Widget 'TextList';
sub Populate{my($w,$args)=@_;
my$option=delete$args->{'-selectmode'};
$w->SUPER::Populate($args);
$w->ConfigSpecs(-selectmode=>['PASSIVE','selectMode','SelectMode','browse']);
$w->ConfigSpecs(-takefocus=>['PASSIVE','takeFocus','TakeFocus','browse']);}sub ClassInit{my($class,$mw)=@_;
$mw->bind($class,'<1>',['BeginSelect',Ev('index',Ev('@'))]);
$mw->bind($class,'<B1-Motion>',['Motion',Ev('index',Ev('@'))]);
$mw->bind($class,'<ButtonRelease-1>','ButtonRelease_1');
$mw->bind($class,'<Shift-1>',['BeginExtend',Ev('index',Ev('@'))]);
$mw->bind($class,'<Control-1>',['BeginToggle',Ev('index',Ev('@'))]);
$mw->bind($class,'<B1-Leave>',['AutoScan',Ev('x'),Ev('y')]);
$mw->bind($class,'<B1-Enter>','CancelRepeat');
$mw->bind($class,'<Up>',['UpDown',-1]);
$mw->bind($class,'<Shift-Up>',['ExtendUpDown',-1]);
$mw->bind($class,'<Down>',['UpDown',1]);
$mw->bind($class,'<Shift-Down>',['ExtendUpDown',1]);
$mw->XscrollBind($class);
$mw->PriorNextBind($class);
$mw->bind($class,'<Control-Home>','Cntrl_Home');
$mw->bind($class,'<Shift-Control-Home>',['DataExtend',0]);
$mw->bind($class,'<Control-End>','Cntrl_End');
$mw->bind($class,'<Shift-Control-End>',['DataExtend','end']);
$class->clipboardOperations($mw,'Copy');
$mw->bind($class,'<space>',['BeginSelect',Ev('index','active')]);
$mw->bind($class,'<Select>',['BeginSelect',Ev('index','active')]);
$mw->bind($class,'<Control-Shift-space>',['BeginExtend',Ev('index','active')]);
$mw->bind($class,'<Shift-Select>',['BeginExtend',Ev('index','active')]);
$mw->bind($class,'<Escape>','Cancel');
$mw->bind($class,'<Control-slash>','SelectAll');
$mw->bind($class,'<Control-backslash>','Cntrl_backslash');
;
$mw->bind($class,'<2>',['scan','mark',Ev('x'),Ev('y')]);
$mw->bind($class,'<B2-Motion>',['scan','dragto',Ev('x'),Ev('y')]);
$mw->bind($class,'<FocusIn>',['tagConfigure','_ACTIVE_TAG',-underline=>1]);
$mw->bind($class,'<FocusOut>',['tagConfigure','_ACTIVE_TAG',-underline=>0]);
return$class;}sub activate{my($w,$element)=@_;
$element=$w->index($element).'.0';
$w->SUPER::tagRemove('_ACTIVE_TAG','1.0','end');
$w->SUPER::tagAdd('_ACTIVE_TAG',$element.' linestart',$element.' lineend');
$w->SUPER::markSet('active',$element);}sub bbox{my($w,$element)=@_;
$element=$w->index($element).'.0' unless($element=~/./);
return$w->SUPER::bbox($element);}sub curselection{my($w)=@_;
my@ranges=$w->SUPER::tagRanges('sel');
my@selection_list;
while(@ranges){my($first,$firstcol)=split(/\./,shift(@ranges));
my($last,$lastcol)=split(/\./,shift(@ranges));
if(defined($selection_list[-1])and($first==$selection_list[-1])){$first++;}if($lastcol==0){$last-=1;}unless($first>$last){push(@selection_list,$first..$last);}}return@selection_list;}sub delete{my($w,$element1,$element2)=@_;
$element1=$w->index($element1);
$element2=$element1 unless(defined($element2));
$element2=$w->index($element2);
$w->SUPER::delete($element1.'.0',$element2.'.0 lineend');}sub deleteChar{my($w,$index1,$index2)=@_;
$index1=$w->index($index1);
$index2=$index1.' +1c' unless(defined($index2));
$index2=$w->index($index2);
$w->SUPER::delete($index1,$index2);}sub get{my($w,$element1,$element2)=@_;
$element1=$w->index($element1);
$element2=$element1 unless(defined($element2));
$element2=$w->index($element2);
my@getlist;
for(my$i=$element1;$i<=$element2;$i++){push(@getlist,$w->SUPER::get($i.'.0 linestart',$i.'.0 lineend'));}return@getlist;}sub getChar{my$w=shift;
return$w->SUPER::get(@_);}sub index{my($w,$element)=@_;
return undef unless(defined($element));
$element.='.0' unless$element=~/\D/;
$element=$w->SUPER::index($element);
my($line,$col)=split(/\./,$element);
return$line;}sub indexChar{my$w=shift;
return$w->SUPER::index(@_);}sub insert{my$w=shift;
my$element=shift;
$element=$w->index($element);
my$item;
while(@_){$item=shift(@_);
$item.="\n";
$w->SUPER::insert($element++.'.0',$item);}}sub insertChar{my$w=shift;
$w->SUPER::insert(@_);}sub selectionAnchor{my($w,$element)=@_;
$element=$w->index($element);
$w->SUPER::markSet('anchor',$element.'.0');}sub selectionClear{my($w,$element1,$element2)=@_;
$element1=$w->index($element1);
$element2=$element1 unless(defined($element2));
$element2=$w->index($element2);
$w->SUPER::tagRemove('sel',$element1.'.0',$element2.'.0 lineend +1c');}sub selectionIncludes{my($w,$element)=@_;
$element=$w->index($element);
my@list=$w->curselection;
my$line;
foreach$line(@list){if($line==$element){return 1;}}return 0;}sub selectionSet{my($w,$element1,$element2)=@_;
$element1=$w->index($element1);
$element2=$element1 unless(defined($element2));
$element2=$w->index($element2);
$w->SUPER::tagAdd('sel',$element1.'.0',$element2.'.0 lineend +1c');}sub selection{}sub see{my($w,$element)=@_;
$element=$w->index($element);
$w->SUPER::see($element.'.0');}sub size{my($w)=@_;
my$element=$w->index('end');
my($text)=$w->get($element);
if(length($text)==0){$element-=1;}return$element;}sub tagAdd{my($w,$tagName,$element1,$element2)=@_;
$element1=$w->index($element1);
$element1.='.0';
$element2=$element1.' lineend' unless(defined($element2));
$element2=$w->index($element2);
$element2.='.0 lineend +1c';
$w->SUPER::tagAdd($tagName,$element1,$element2);}sub tagAddChar{my$w=shift;
$w->SUPER::tagAdd(@_);}sub tagRemove{my($w,$tagName,$element1,$element2)=@_;
$element1=$w->index($element1);
$element1.='.0';
$element2=$element1.' lineend' unless(defined($element2));
$element2=$w->index($element2);
$element2.='.0 lineend +1c';
$w->SUPER::tagRemove('sel',$element1,$element2);}sub tagRemoveChar{my$w=shift;
$w->SUPER::tagRemove(@_);}sub tagNextRange{my($w,$tagName,$element1,$element2)=@_;
$element1=$w->index($element1);
$element1.='.0';
$element2=$element1 unless(defined($element2));
$element2=$w->index($element2);
$element2.='.0 lineend +1c';
my$index=$w->SUPER::tagNextrange('sel',$element1,$element2);
my($line,$col)=split(/\./,$index);
return$line;}sub tagNextRangeChar{my$w=shift;
$w->SUPER::tagNextrange(@_);}sub tagPrevRange{my($w,$tagName,$element1,$element2)=@_;
$element1=$w->index($element1);
$element1.='.0';
$element2=$element1 unless(defined($element2));
$element2=$w->index($element2);
$element2.='.0 lineend +1c';
my$index=$w->SUPER::tagPrevrange('sel',$element1,$element2);
my($line,$col)=split(/\./,$index);
return$line;}sub tagPrevRangeChar{my$w=shift;
$w->SUPER::tagPrevrange(@_);}sub markSet{my($w,$mark,$element1)=@_;
$element1=$w->index($element1);
$element1.='.0';
$w->SUPER::markSet($element1,$mark);}sub markSetChar{my$w=shift;
$w->SUPER::markSet(@_);}sub markNext{my($w,$element1)=@_;
$element1=$w->index($element1);
$element1.='.0';
return$w->SUPER::markNext($element1);}sub markNextChar{my$w=shift;
$w->SUPER::markNext(@_);}sub markPrevious{my($w,$element1)=@_;
$element1=$w->index($element1);
$element1.='.0';
return$w->SUPER::markPrevious($element1);}sub markPreviousChar{my$w=shift;
$w->SUPER::markPrevious(@_);}sub ButtonRelease_1{my$w=shift;
my$Ev=$w->XEvent;
$w->CancelRepeat;
$w->activate($Ev->xy);}sub Cntrl_Home{my$w=shift;
my$Ev=$w->XEvent;
$w->activate(0);
$w->see(0);
$w->selectionClear(0,'end');
$w->selectionSet(0)}sub Cntrl_End{my$w=shift;
my$Ev=$w->XEvent;
$w->activate('end');
$w->see('end');
$w->selectionClear(0,'end');
$w->selectionSet('end')}sub Cntrl_backslash{my$w=shift;
my$Ev=$w->XEvent;
if($w->cget('-selectmode')ne 'browse'){$w->selectionClear(0,'end');}}sub BeginSelect{my$w=shift;
my$el=shift;
if($w->cget('-selectmode')eq 'multiple'){if($w->selectionIncludes($el)){$w->selectionClear($el)}else{$w->selectionSet($el)}}else{$w->selectionClear(0,'end');
$w->selectionSet($el);
$w->selectionAnchor($el);
my@list=();
$w->{'SELECTION_LIST_REF'}=\@list;
$w->{'PREVIOUS_ELEMENT'}=$el}$w->focus if($w->cget('-takefocus'));}sub Motion{my$w=shift;
my$el=shift;
if(defined($w->{'PREVIOUS_ELEMENT'})&&$el==$w->{'PREVIOUS_ELEMENT'}){return;}if($w->curselection==0){$w->activate($el);
$w->selectionSet($el);
$w->selectionAnchor($el);
$w->{'PREVIOUS_ELEMENT'}=$el;
return;}my$anchor=$w->index('anchor');
my$mode=$w->cget('-selectmode');
if($mode eq 'browse'){$w->selectionClear(0,'end');
$w->selectionSet($el);
$w->{'PREVIOUS_ELEMENT'}=$el;}elsif($mode eq 'extended'){my$i=$w->{'PREVIOUS_ELEMENT'};
if($w->selectionIncludes('anchor')){$w->selectionClear($i,$el);
$w->selectionSet('anchor',$el)}else{$w->selectionClear($i,$el);
$w->selectionClear('anchor',$el)}while($i<$el&&$i<$anchor){if(Tk::lsearch($w->{'SELECTION_LIST_REF'},$i)>=0){$w->selectionSet($i)}$i+=1}while($i>$el&&$i>$anchor){if(Tk::lsearch($w->{'SELECTION_LIST_REF'},$i)>=0){$w->selectionSet($i)}$i+=-1}$w->{'PREVIOUS_ELEMENT'}=$el}}sub BeginExtend{my$w=shift;
my$el=shift;
if($w->curselection==0){$w->activate($el);
$w->selectionSet($el);
$w->selectionAnchor($el);
$w->{'PREVIOUS_ELEMENT'}=$el;
return;}if($w->cget('-selectmode')eq 'extended'&&$w->selectionIncludes('anchor')){$w->Motion($el)}}sub BeginToggle{my$w=shift;
my$el=shift;
if($w->cget('-selectmode')eq 'extended'){my@list=$w->curselection();
$w->{'SELECTION_LIST_REF'}=\@list;
$w->{'PREVIOUS_ELEMENT'}=$el;
$w->selectionAnchor($el);
if($w->selectionIncludes($el)){$w->selectionClear($el)}else{$w->selectionSet($el)}}}sub AutoScan{my$w=shift;
my$x=shift;
my$y=shift;
if($y>=$w->height){$w->yview('scroll',1,'units')}elsif($y<0){$w->yview('scroll',-1,'units')}elsif($x>=$w->width){$w->xview('scroll',2,'units')}elsif($x<0){$w->xview('scroll',-2,'units')}else{return;}$w->Motion($w->index("@".$x.','.$y));
$w->RepeatId($w->after(50,'AutoScan',$w,$x,$y));}sub UpDown{my$w=shift;
my$amount=shift;
$w->activate($w->index('active')+$amount);
$w->see('active');
my$selectmode=$w->cget('-selectmode');
if($selectmode eq 'browse'){$w->selectionClear(0,'end');
$w->selectionSet('active')}elsif($selectmode eq 'extended'){$w->selectionClear(0,'end');
$w->selectionSet('active');
$w->selectionAnchor('active');
$w->{'PREVIOUS_ELEMENT'}=$w->index('active');
my@list=();
$w->{'SELECTION_LIST_REF'}=\@list;}}sub ExtendUpDown{my$w=shift;
my$amount=shift;
if($w->cget('-selectmode')ne 'extended'){return;}$w->activate($w->index('active')+$amount);
$w->see('active');
$w->Motion($w->index('active'))}sub DataExtend{my$w=shift;
my$el=shift;
my$mode=$w->cget('-selectmode');
if($mode eq 'extended'){$w->activate($el);
$w->see($el);
if($w->selectionIncludes('anchor')){$w->Motion($el)}}elsif($mode eq 'multiple'){$w->activate($el);
$w->see($el)}}sub Cancel{my$w=shift;
if($w->cget('-selectmode')ne 'extended'||!defined$w->{'PREVIOUS_ELEMENT'}){return;}my$first=$w->index('anchor');
my$last=$w->{'PREVIOUS_ELEMENT'};
if($first>$last){($first,$last)=($last,$first);}$w->selectionClear($first,$last);
while($first<=$last){if(Tk::lsearch($w->{'SELECTION_LIST_REF'},$first)>=0){$w->selectionSet($first)}$first+=1}}sub SelectAll{my$w=shift;
my$mode=$w->cget('-selectmode');
if($mode eq 'single'||$mode eq 'browse'){$w->selectionClear(0,'end');
$w->selectionSet('active')}else{$w->selectionSet(0,'end')}}sub SetList{my$w=shift;
$w->delete(0,'end');
$w->insert('end',@_);}sub deleteSelected{my$w=shift;
my$i;
foreach$i(reverse$w->curselection){$w->delete($i);}}sub clipboardPaste{my$w=shift;
my$element=$w->index('active')||$w->index($w->XEvent->xy);
my$str;
eval{local$SIG{__DIE__};$str=$w->clipboardGet};
return if$@;
foreach(split("\n",$str)){$w->insert($element++,$_);}}sub getSelected{my($w)=@_;
my$i;
my(@result)=();
foreach$i($w->curselection){push(@result,$w->get($i));}return(wantarray)?@result:$result[0];}1;
