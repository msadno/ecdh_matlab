function z=addEC(P,Q,E)
    %Return point addition in E: P+Q=(x3,y3)
    %Input as P=[x1 y1], Q=[x2 y2], E=[p,a,b]
    p=E(1); 
    a=E(2);
    x1=P(1);
    y1=P(2);
    x2=Q(1);
    y2=Q(2);
    
    if (x1==Inf || x2==Inf)
        if x1==Inf
            z=Q;
        else
            z=P;
        end
    elseif (x1==x2 && (y1~=y2 || y1==0 || y2==0))
        z=[Inf Inf];
    else
        if x1~=x2
            u=powermod((x2-x1),-1,p);
            s=mod((y2-y1)*u,p);
        else
            u=powermod(2*y1,-1,p);
            s=mod((3*x1^2+a)*u,p);
        end
        x3=mod(s^2-x1-x2,p);
        y3=mod(s*(x1-x3)-y1,p);
        z=[x3 y3];
    end
end