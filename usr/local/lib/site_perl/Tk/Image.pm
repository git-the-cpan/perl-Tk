package Tk::Image;
require DynaLoader;
use base qw(DynaLoader Tk);
use vars qw($VERSION);
$VERSION = '3.014'; # $Id: //depot/Tk8/Tk/Image.pm#14 $
sub new{my$package=shift;
my$widget=shift;
$package->InitClass($widget);
my$leaf=$package->Tk_image;
my$obj=$widget->Tk::image('create',$leaf,@_);
return bless$obj,$package;}sub Install{my($class,$mw)=@_;}sub ClassInit{my($package,$mw)=@_;
return$package;}require Tk::Submethods;
Direct Tk::Submethods('image'=>[qw(delete width height type)]);
sub Tk::Widget::imageNames{my$w=shift;
$w->image('names',@_);}sub Tk::Widget::imageTypes{my$w=shift;
map("\u$_",$w->image('types',@_));}sub Construct{my($base,$name)=@_;
my$class=(caller(0))[0];
delete${"$class\::"}{'::ISA::CACHE::'}if$]==5.006;
*{"Tk::Widget::$name"}=sub{$class->new(@_)};}sub DESTROY{my$i=shift;}1;
