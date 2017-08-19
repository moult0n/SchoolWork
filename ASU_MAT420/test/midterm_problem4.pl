#!/usr/bin/perl -w
use strict;
my @primes = (2,3,5,7,11,13,17,19,23,29,31,37,41,43,47);

sub listprimes {
	my $n = shift;
	my @answer = ();
	foreach my $var (0 .. $#primes){
		next if $primes[$var] > $n;
		push @answer, $primes[$var];
	}
	print "@answer\n";
}
sub random {
	my($a,$b) = @_;
	return int(rand($b-$a+1))+$a;
}
my $a = random(10,50);
listprimes($a);

