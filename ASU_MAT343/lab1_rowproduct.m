function C = rowproduct(A, B)
[m,n]=size(A);
[p,q]=size(B);
if (n==p)
   C = zeros(m,q);
   for i = 1:m
       C(i,:) = A(i,:)*B;
   end
else
    disp('dimensions do not match')
    C = [];
end
end