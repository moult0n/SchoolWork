#set term wxt font ",14" enhanced # open figure window
set xtics 0,.2,1 # set tickmarks every 0.2 from 0 to 1 in x direction
set grid
set xlabel "x"
set ylabel "u(x)"
set title "solution of -u''+2au'=1 , u(0)=0, u(1)=0, a = 10"
unset key # remove legend
plot "bvp_exact10.dat" with lines lw 3 lc rgb "blue"
	#"bvp_sol.dat" with points lc rgb "red" pt 6 ps 3
	#"bvp_sol.dat" with points lc rgb "red" pt 7 ps 2 
pause -1 "Press Enter to continue"
set term postscript eps enhanced color solid font ",24"
set output "bvp_gnuplot10.eps"
replot
