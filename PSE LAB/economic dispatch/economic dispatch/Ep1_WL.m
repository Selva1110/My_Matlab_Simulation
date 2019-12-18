clc; D=load1; d=data1;
B=Bdat1; b=d(:,3); c=d(:,4);
Pl=d(:,5); Ph=d(:,6);
dP=D; x=max(b);dB=diag(B);
P=(x-b)./c/2;
while abs(dP)>0.00001
    P=(x-b-2*(B*P-dB.*P))./(c+2*x*dB);
    P=min(P,Ph); P=max(P,Pl);
    dP=D+P'*B*P-sum(P);
    x=x+dP*2/(sum(1./c));
end
C=d(:,2)+b.*P+c.*P.*P;
totalCost=sum(C); display(totalCost);
Loss=P'*B*P; display(Loss);
table(d(:,1),P,C,'V',{'Unit' 'Power' 'Cost'})

%% Economic load dispatch of Real power
% x is lambda,
% P is Real Power vector of all units
% B is loss coefficients matrix
% C is cost of production
% Pl Ph are min and max onstraints