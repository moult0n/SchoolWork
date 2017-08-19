#!/usr/bin/perl -w
use strict;

sub function {
	my $input = shift(@_);
	my $y = $input**2+2*$input+2;
	return $y;
}

my $sumError;
my $sumSol;
my $ip = -4;
my $fp = 4;
my $act = 2;
for (my $h = 1;$h >= .0001; $h=$h/10){
	print "H=$h\n";
	$sumError = 0;
	$sumSol = 0;
	for my $x ($ip..$fp){
		my $a = -function($x-2*$h)+16*function($x-$h)-30*function($x);
		my $b = 16*function($x+$h)-function($x+2*$h);
		my $c = 12*$h**2;
		my $d = ($a+$b)/$c;
		$sumError = $sumError+($d-$act);
		$sumSol = $sumSol+$d;
	}
	$sumSol = $sumSol/($fp-$ip+1);
	$sumError = $sumError/($fp-$ip+1);
	print "Average Error in Solution = $sumError : Average Solution = $sumSol\n";
}
