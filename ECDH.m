%====ECDH====
%Alice and Bob using Elliptic Curve E and Point P
clear;
close all;
clc;
p=101; %prime p, 
%p = nextprime(n) ; 
[E P]=GenKey(p);

disp('Elliptic Curve : ')
E
disp('Point : ')
P
disp('================ ALICE ====================');
%Alice secret key and public key
kA = randi(p); %secret key for Alice
pbA = mulEC(kA,P,E); %public key 
disp('Secret key and public key for Alice : ')
disp(['Secret Key = ', num2str(kA)]);
disp(['Public Key = (', num2str(pbA),')']);

disp('=============== BOB =======================');
%Bob secret key and public key
kB = randi(p); %secret key for Alice
pbB = mulEC(kB,P,E); %public key 
disp('Secret key and public key for Bob : ')
disp(['Secret Key = ', num2str(kB)]);
disp(['Public Key = (', num2str(pbB),')']);

disp('============= SHARED KEY ==================');
%Alice compute shared key = kA*(pbB)
skA = mulEC(kA,pbB,E); %public key 
disp(['Alice shared key = (',num2str(skA),')']);

%Bob compute shared key = kB*(pbA)
skB = mulEC(kB,pbA,E); %public key 
disp(['Bob shared key = (',num2str(skB),')']);

if skA==skB
   disp(['Alice and Bob using shared key = (', num2str(skA),')']); 
else
   disp('Alice and Bob using different shared key');
end

