package Tk::ItemStyle;
use vars qw($VERSION);
$VERSION = '3.006'; # $Id: //depot/Tk8/Tk/ItemStyle.pm#6 $
require Tk;
use base  qw(Tk);
require Tk::Widget;
Construct Tk::Widget 'ItemStyle';
Tk::Methods('delete');
sub new{my$package=shift;
my$widget=shift;
my$type=shift;
my%args=@_;
$args{'-refwindow'}=$widget unless exists$args{'-refwindow'};
$package->InitClass($widget);
my$obj=$widget->itemstyle($type,%args);
return bless$obj,$package;}sub Install{my($class,$mw)=@_;}sub ClassInit{my($package,$mw)=@_;
return$package;}1;
