package Tk::Label;
require Tk;
use vars qw($VERSION);
$VERSION = '3.011'; # $Id: //depot/Tk8/Tk/Label.pm#11 $
use base  qw(Tk::Widget);
Construct Tk::Widget 'Label';
sub Tk_cmd{\&Tk::label}1;
