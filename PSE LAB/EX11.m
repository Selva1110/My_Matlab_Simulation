clc;
disp('ECONOMIC LOAD DISPATCH:');
fprintf('\nEnter the method \n 1. Without loss and limits:\n2.Without loss and with limits:\n ');
ch=input('Enter the choice:');
switch(ch)
    case 1
        n=input('Enter the number of units:');
        e=input('Enter the value of tolerance:');
        l=0;
        for i=1:n
            a(i)=input('Enter the value of a:');
            b(i)=input ('Enter the value of b:');
            c(i)=input('Enter the value of c:');
            pg(i)=(l-b(i))/(2*a(i));
        end
        pd=input ('Enter the total demand');
        s=0;
        for i=1:n
            s=s+pg(i);
        end
        d=s-pd;
        di=abs(d);
        dk=0;
        if(di>e)
            for i=1:n
                dk=dk+(1/(2*a(i)));
            end
            dl=di/dk;
            if(pg<pd)
                ln=dl+l
            else if(pg>pd)
                    ln=dl-l;
                end
            end
        end
        for i=1:n
            pg(i)=(ln-b(i))/(2*a(i));
        end
        pg
        p=0;
        for i=1:n
            p=p+pg(i);
        end
        p;
        d=p-pd;
        di=abs(d)
    case 2
        pd=input('Enter the power demand:');
        n=input('Enter the number of units:');
        s=0;
        p=0;
        e=0.001;
        for i=1:n
            a(i)=input('Enter the value of a:');
            b(i)=input('Enter the value of b:');
            c(i)=input('Enter the value of c:');
            r(i)=(b(i)/(2*a(i)));
            s=s+r(i);
            d(i)=(1/(2*a(i)));
            p=p+d(i);
        end
        l=(pd+s)/p
        k=0;
        for i=1:n
            v(i)=input('Enter the lower limit:');
            u(i)=input('Enter the upper limit:');
            pg(i)=((l-b(i))/(2*a(i)));
            if (pg(i)<v(i)||pg(i)>u(i))
                if(pg(i)<v(i))
                    pgl=v(1);
                    pgl
                else
                    pgl=u(i);
                    pgl
                end
                pdl=pd-pgl;
                fprintf('The Violating Generator Bus is %g',i);
            end
        end
        g=0;
        h=0;
        for i=1:(n-1)
            o(i)=input('Enter the other bus:');
            m=o(i);
            w(i)=(b(m)/(2*a(m)));
            k=k+w(i);
            t(i)=(1/(2*a(m)));
            g=g+t(i);
        end
        ln=((pdl+k)/g)
        for i=1:(n-1)
            m=o(i);
            pgn(i)=(ln-b(m))/(2*a(m));
            h=h+pgn(i);
        end
        z=h+pgl;
        di=pd-z;
        di
        pgl
        pgn
end