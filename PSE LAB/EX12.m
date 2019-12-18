clc;
display('CALCULATION OF Y-BUS MATRIX BY DIRECT INSPECTION METHOD');
b=input('Enter the number of buses:');
nl=input('Enter the number of lines:');
y=zeros(b,b);
for i=1:1:nl
        sb(i)=input('Enter the Starting bus number:');
        eb(i)=input('Enter the Ending bus number:');
        z(i)=input('Enter the impedence Value:');
        shy(i)=input('Enter the halfline charging admitance:');
        sy(i)=1/z(i);
        l=sb(i);
        m=eb(i);
        y(l,l)=y(l,l)+sy(i)+shy(i);
        y(m,m)=y(m,m)+sy(i)+shy(i);
        y(l,m)=y(l,m)-sy(i);
        y(m,l)=y(m,l)-sy(i);
end
y
v(l)=input('Enter the slack bus voltage:');
v1(l)=v(l);
v2(l)=v(l);
for i=2:b
    pg(i)=input('Enter the generator real power in pu:');
    qg(i)=input('Enter the generator reactive power in pu:');
    pl(i)=input('Enter the load real power in PU:');
    ql(i)=input('Enter the load reactive in PU:');
    v(i)=input('Enter the initial value of bus voltage:');
    P(i)=pg(i)-pl(i);
    Q(i)=qg(i)-ql(i);
end 
ac=input('Enter the acceleration factor:');
t=input('Enter the tolerance limit:');
n=input('Enter the number of iteration:');
vmax=1;
for h=1:n
    if(vmax>t)
        for p=2:b
            l(p)=0;
            l1(p)=0;
            for q=1:(p-1)
                l(p)=l(p)+(y(p,q)*v1(q));
            end
            for q=(p+1):b
                l1(p)=l1(p)+(y(p,q)*v(q));
            end
            v1(p)=(((P(p)-Q(p))/conj(v(p)))-l(p)-l1(p))/y(p,p);
            va(p)=v(p)+(ac*v1(p)-v(p));
            vd(p)=abs(va(p)-v(p));
            v1(p)=va(p);
        end
            for i=2:(b-1)
                for j=3:b
                    if(vd(i)>vd(j))
                        vmax=vd(i);
                    else
                        vmax=vd(i);
                    end
                end
            end
            for i=1:b
                disp('Iteration Number');
                h
                disp('Bus Number');
                i
                disp('Bus Voltage');
                v1(i)
                disp('Difference in Voltage');
                vd(i)
            end
            for i=1:b
                v(i)=v1(i);
            end
          else
                break;
        end
end