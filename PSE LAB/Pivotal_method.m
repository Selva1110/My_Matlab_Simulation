clc;
nb=input('Enter the number of buses');
nl=input('Enter the number of lines');
for i=1:1:nl
        sb(i)=input('Enter the Starting bus number:');
        eb(i)=input('Enter the Ending bus number:');
        z(i)=input('Enter the impedence Value:');
end
y=zeros(nb,nb);
for i=1:1:nl
    sy(i)=1/z(i);
    l=sb(i);
    m=eb(i);
    y(l,l)=y(l,l)+sy(i);
    y(m,m)=y(m,m)+sy(i);
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
z=zeros(nb,nb);
z=inv(y);
z
z=zeros(nb,nb);
for i=1:1:nb
    for j=1:1:nb
        if (i==j)
            z(i,i)=-1/y(i,i);
        else
            z(i,j)=-y(i,j)/y(i,i);
            z(j,i)=-(y(j,i)/y(i,i);
        end 
    end
end
for l=1:(nb-1)
    c(l)= input('enter the other element:');
end
for d=1:(nb-1)
    for m=1:(nb-1)
        q=c(d);
        p=c(m);
        if(p==q)
            z(p,p)=(ypp -(y(p,i)*y(i,p))/y(i,i))
        else
            z(p,q)=(y(p,q)-(y(p,i)*y(i,p))/y(i,i));
            z(q,p)=(y(q,p)-(y(q,i)*y(i,q))/y(i,i));
        end
    end
end
z