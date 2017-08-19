function p = koch(lev,p,t) % p is initial pattern, t is refinement pattern
if lev==0, return ; end
p = koch(lev-1,p,t); % get initial pattern from lower level
n = size(p,2); m = size(t,2);
pp = repmat(p,m,1); % initialize coordinates of inserted points
for k = 2:n
    u = diff(p(:,[k-1,k]),1,2); % vector between consecutive points
    a = angle(complex(u(1),u(2))); % angle between vector and horizontal line
    c = cos(a); s = sin(a);
    R = [c,-s;s,c]; % rotation matrix
    q = R*(t*norm(u)); % scale and rotate line segment
    pp(:,k-1) = pp(:,k-1)+q(:); % shift line segment
end
p = [p(:,1),reshape(pp(3:2*m,1:n-1),2,(m-1)*(n-1))]; % delete duplicate points