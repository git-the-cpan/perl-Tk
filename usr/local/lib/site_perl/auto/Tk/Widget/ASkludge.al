package Tk::Widget;
sub ASkludge{my($hash,$sense)=@_;
foreach my $key(%$hash){if($key=~/-.*variable/&&ref($hash->{$key})eq 'SCALAR'){if($sense){my$val=${$hash->{$key}};
require Tie::Scalar;
tie${$hash->{$key}},'Tie::StdScalar';
${$hash->{$key}}=$val;}else{untie${$hash->{$key}};}}}}1;
