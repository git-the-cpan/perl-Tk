package Tk::Frame;
sub freeze_on_map{my($w)=@_;
unless($w->Tk::bind('Freeze','<Map>')){$w->Tk::bind('Freeze','<Map>',['packPropagate'=>0])}$w->AddBindTag('Freeze');}1;
