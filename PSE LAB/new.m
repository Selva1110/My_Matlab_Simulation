clc;
nb=input('Enter the number of buses:');
nl=input('Enter the number of lines:');
for i=1:1:nl
        sb(i)=input('Enter the Starting bus number:');
        eb(i)=input('Enter the Ending bus number:');
        z(i)=input('Enter the impedence Value:');
        shy(i)=input('Enter the halfline charging admitance:');
end
y=zeros(nb,nb);
for i=1:1:nl
    sy(i)=1/z(i);
    l=sb(i);
    m=eb(i);
    y(l,l)=y(l,l)+sy(i)+shy(i);
    y(m,m)=y(m,m)+sy(i)+shy(i);
    y(l,m)=y(l,m)-sy(i);
    y(m,l)=y(m,l)-sy(i);
end
y

n=input('Enter the number of Impedence to be added:');
for i=1:1:n
b=input('Enter the bus number:');
az=input('Enter the impedence Value:');
y(b,b)=y(b,b)+(1/az);
end

y
zb=inv(y);
zb
k=input('Enter the faulted Bus Number');
ifault=1/zb(k,k);
vf=zeros(nb);
for i=1:1:nb
    vf(i)=(1-zb(i,k)/zb(k,k));
end
vf(k)=0;
vf