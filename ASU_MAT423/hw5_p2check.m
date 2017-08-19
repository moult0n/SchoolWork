syms x
s1 = 14/15*x+8/3;
s2 = (-4/75)*(x^2)+(18/5)*x-92/3;
s3 = (4/75)*x^2-(74/15)*x+140;
s4 = (-4/45)*(x^2)-(482/45)*x-2612/9;
c1 = double(subs(s1,10))
c2 = double(subs(s1,25))
c3 = double(subs(s2,25))
c4 = double(subs(s2,40))
c5 = double(subs(s3,40))
c6 = double(subs(s3,55))
c7 = double(subs(s4,55))
c8 = double(subs(s4,70))
