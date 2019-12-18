%% Economic load dispatch of Real power
% NOT considering transmission losses
clc;
D=load1;
d=data1;
b=d(:,3);
c=d(:,4);
Pl=d(:,5);
Ph=d(:,6);
dP=D;
x=max(b); % assume lambda
while abs(dP)>0.00001
    P=(x-b)./c/2;
    P=min(P,Ph);
    P=max(P,Pl);
    dP=D-sum(P);
    x=x+dP*2/(sum(1./c));
end
C=d(:,2)+b.*P+c.*P.*P; % Costs
totalCost=sum(C);
display(totalCost);
table(d(:,1),P,C,'V',{'Unit' 'Power' 'Cost'})