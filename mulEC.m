function z=mulEC(k,P,E)
   %Return kP = P+P+...+P (k times addition) on Elliptic Curve E
   
   %== compute k as binary
   n=1+floor(log2(k));
   d=zeros(1,n);
   t=k;
   for i=1:n
      d(i)=mod(t,2);
      t=floor(t/2);
   end
   %======
   
   T=P;
   for i=(n-1):-1:1
      T=addEC(T,T,E);
      if d(i)==1
         T=addEC(T,P,E); 
      end
   end
   z=T;
end