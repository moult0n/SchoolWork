function C = columnproduct(A, B)
[m,n]=size(A);
[p,q]=size(B);
if (n==p)
   C = zeros(m,q);
   for i = 1:q
       C(:,i) = A*B(:,i);
   end
else
    disp('dimensions do not match')
    C = [];
end
end