clc;
display('CALCULATION OF Y-BUS MATRIX BY Gaussian Ellimination Method');
nb=input('Enter the number of buses:');
nl=input('Enter the number of lines:');
for i=1:1:nl
        sb(i)=input('Enter the Starting bus number:');
        eb(i)=input('Enter the Ending bus number:');
        z(i)=input('Enter the impedence Value:');
        shz(i)=input('Enter the halfline charging Impedence:');
end
y=zeros(nb,nb);
for i=1:1:nl
    sy(i)=1/z(i);
    shy(i)=1/shz(i);
    l=sb(i);
    m=eb(i);
    y(l,l)=y(l,l)+sy(i)+shy(i);
    y(m,m)=y(m,m)+sy(i)+shy(i);
    y(l,m)=y(l,m)-sy(i);
    y(m,l)=y(m,l)-sy(i);
end
y
k=input('Enter the bus to be Eliminated:');
for l=1:1:(nb)
    for m=1:1:(nb)
    y(l,m)=y(l,m)-(y(l,k)*y(k,m))/y(k,k);
    end
end
y(k,:)=[];
y(:,k)=[];
y
