#!/usr/bin/perl -w
use strict; 

my $max= $ARGV[0];
my @primes = ();
my @notprime = (1);
my $remove;
if ($max > 0){	
	for my $index (2..$max){
		next if $notprime[$index];
		push @primes, $index;
		for ($remove = $index; $remove <= $max; $remove+=$index){
			$notprime[$remove] = 1;
		}
	}
	print "@primes\n";
}
else {	
	print "Cannot be run this number, please reconsider and use a valid number that is greater than 0.\n";
}

