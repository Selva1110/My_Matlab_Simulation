clc;
disp('Y-BUS Formation By Singular Transformation Method');
nb=input('Enter the number of Buses:');
nl=input('Enter the number of Elements:');
a=zeros(nb,nl);
zp=zeros(nl,nl);
yp=zeros(nl,nl);
yb=zeros(nb,nb);
for i=1:nl
    l=input('Enter the line number:');
    sb(i)=input('Enter the starting Bus number:');
    if sb(i)>0 
        a(sb(i),i)=1;
    end
    se(i)=input('Enter the Ending Bus number:');
    if se(i)>0
        a(se(i),i)=-1;
    end
    zp(l,l)=input('Enter the series impedence');
    yp(l,l)=inv(zp(l,l));
end
a
yp
coupling=input('Is the line Mutually Coupled? yes=1 no=0; Enter your Option:');
if (coupling==1)
    k=input('Enter the number of coupling to be added');
    for i=1:k
        l=input('Enter the starting Line number');
        m=input('Enter the Ending Line number');
        z=input('Enter the coupling Impedence');
        yp(l,m)=1/z;
        yp(m,l)=yp(l,m);
    end
end
yb=a*yp*a';
yb
        
        
