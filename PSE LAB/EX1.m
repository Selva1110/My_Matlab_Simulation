clc;
display('CALCULATION OF Y-BUS MATRIX BY DIRECT INSPECTION METHOD');
nb=input('Enter the number of buses:');
nl=input('Enter the number of lines:');
y=zeros(nb,nb);
for i=1:1:nl
        l=input('Enter the Starting bus number:');
        m=input('Enter the Ending bus number:');
        z(i)=input('Enter the impedence Value:');
        shy(i)=input('Enter the halfline charging admitance:');
        sy(i)=1/z(i);
        y(l,l)=y(l,l)+sy(i)+shy(i);
        y(m,m)=y(m,m)+sy(i)+shy(i);
        y(l,m)=y(l,m)-sy(i);
        y(m,l)=y(m,l)-sy(i);
end
y
h=input('Enter the choice:');
switch(h)
    case 1
n=input('Enter the number of buses to be added:');
for i=1:1:n
b=input('Enter the Starting bus number:');
c=input('Enter the ending bus number:');
az(i)=input('Enter the impedence Value:');
shy(i)=input('Enter the halfline charging admitance:');
y(b,b)=y(b,b)+(1/az(i))+shy(i);
y(c,c)=y(c,c)+(1/az(i))+shy(i);
y(c,b)=y(c,b)-(1/az(i));
y(b,c)=y(b,c)-(1/az(i));
end
    case 2
n=input('Enter the number of buses to be Eliminated:');
for i=1:1:n
b=input('Enter the Starting bus number:');
c=input('Enter the ending bus number:');
az(i)=input('Enter the impedence Value:');
shy(i)=input('Enter the halfline charging admitance:');
y(b,b)=y(b,b)-(1/az(i))-shy(i);
y(c,c)=y(c,c)-(1/az(i))-shy(i);
y(c,b)=y(c,b)+(1/az(i));
y(b,c)=y(b,c)+(1/az(i));
end
 case 3
n=input('Enter the number of Impedence to be added:');
for i=1:1:n
b=input('Enter the bus number:');
az=input('Enter the impedence Value:');
y(b,b)=y(b,b)+(1/az);
end

    otherwise
        disp('Enter the correct choice');
end
y
