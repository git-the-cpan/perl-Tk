package Tk::Listbox;
sub deleteSelected{my$w=shift;
my$i;
foreach$i(reverse$w->curselection){$w->delete($i);}}1;
