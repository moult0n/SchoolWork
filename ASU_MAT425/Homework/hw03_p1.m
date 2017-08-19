format long
f = @(x) sin(x);
x0 = 1;
h = [10^(-1), 10^-2, 10^-3];
sol = zeros(3);
sol(1,1) = N1fd(f,x0,h(1));
sol(2,1) = N1fd(f,x0,h(2));
sol(3,1) = N1fd(f,x0,h(3));
sol(1,2) = N2fd(f,x0,h(1));
sol(2,2) = N2fd(f,x0,h(2));
sol(3,2) = N2fd(f,x0,h(3));
sol(1,3) = N3fd(f,x0,h(1));
sol(2,3) = N3fd(f,x0,h(2));
sol(3,3) = N3fd(f,x0,h(3));
sol
e = abs(cos(1)-sol)
