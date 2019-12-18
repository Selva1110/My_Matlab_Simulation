clc;
nl=input('Enter the number of loads:');
for i=1:nl
    s(i)=input('Enter the starting time:');
    e(i)=input ('Enter the ending time:');
    l(i)=input('Enter the load value:');
end
cl=sum(e);
md=max(e);
te=0;
for i=1:nl
    in(i)=e(i)-s(i);
    te=(l(i)*in(i)+te);
end
te;
avgl=te/24;
lf=avgl/md;
d=input('Enter the Choice:');
switch(d)
    case 1
        e=input ('Enter the last value of X-axis:');
        t=input('Enter the last value of Y-axis');
        x=[s,e];
        y=[l,t];
        stairs(x,y);
    case 2
        lt=input('Enter the least load');
        [x,y]=dsort(l);
        for i=1:nl
            f(i)=x(i);
        end
        for i=1:nl
            a(i)=int(y);
        end
        b=0;
        for i=1:nl
            k(i)=a(i)+b;
            b=k(i);
        end
        p=[0,k];
        q=[f,lt];
        stairs(p,q);
end
        
