%% Solve symbolically for the jacobian

syms cnx cny P cyx cxy X Y

f(X,Y) = [(1/(X+Y))*(cnx*X*(P-X-Y)+X*Y*(cyx-cxy)), (1/(X+Y))*(cny*Y*(P-X-Y)+X*Y*(cxy-cyx))];
g(X,Y) = [(cnx*X*(P-X-Y)+X*Y*(cyx-cxy)), (cny*Y*(P-X-Y)+X*Y*(cxy-cyx))];
% f(X,Y) = [(cnx*X*(P-X-Y)+X*Y*(cyx-cxy)), (cny*Y*(P-X-Y)+X*Y*(cxy-cyx))];
G = jacobian(g, [X,Y]);
F = jacobian(f, [X,Y]);
G = simplify(G);
F = simplify(F)
g1S = subs(G, [X, Y], [0, 0])
f2s = simplify(subs(F, [X, Y], [X, P-X]))
f3s = simplify(subs(F, [X, Y], [X, (cnx*P-cnx*X)/(cnx+cyx-cxy)]))
