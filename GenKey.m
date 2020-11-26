function [E P]=GenKey(p)
    %GenKey, generate the elliptic curve E : y^2 = x^3 + ax + b (mod p)
    % p = prime number
    %GenKey will return p,a,b and point (x,y) in E as public key
    %GenKey output [p, a, b, x, y]

    a=randi(p);
    x=randi(p);
    y=randi(p);
    %Compute b
    b=mod(y^2-x^3-a*x,p);
    %Check discriminant
    D=mod(4*a^3+27*b^2, p);
    while D==0 
        x=randi(p);
        y=randi(p);
        b=mod(y^2-x^3-a*x,p);
        D=mod(4*a^3+27*b^2, p);
    end
    E = [p a b];
    P = [x y];
    
    %Plot the EC
    xp=[]; yp=[];
    for x=0:p-1
        for y=0:p-1
            cp=mod(y^2-x^3-a*x-b,p);
            if cp==0
                xp=[xp x];
                yp=[yp y];
            end
        end
    end
    scatter(xp,yp,'filled');
    title(['Elliptic Curve y^2 = x^3+',num2str(a),'x+',num2str(b),' (mod ',num2str(p),')']);    
end