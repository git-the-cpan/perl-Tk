package Tk::WinPhoto;
require DynaLoader;
use vars qw($VERSION);
$VERSION = '3.008'; # $Id: //depot/Tk8/WinPhoto/WinPhoto.pm#8 $
use Tk qw($XS_VERSION);
require Tk::Image;
require Tk::Photo;
use base  qw(DynaLoader);
bootstrap Tk::WinPhoto;
1;
__END__


