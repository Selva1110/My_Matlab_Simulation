clc;
x=0;
y=0;
z=0;
k=0;
n=input('Enter the number of generating Units:');
pd=input('Enter the Value of Load demand:');
for i=1:n
    a(i)=input('Enter the constant a of the generating Unit:');
    b(i)=input('Enter the constant b of the generating Unit:');
    c(i)=input('Enter the constant c of the generating Unit:');
    x=x+(b(i)/(2*a(i)));
    y=y+(1/(2*a(i)));
end
pg=zeros(n);
ch=input('Enter choice 1.Without Limit 2.With Limit:');
switch(ch)
    case 1
        lm=((pd+x)/y);
        for i=1:n
            pg(i)=(lm-b(i))/(2*a(i))
        end
    case 2
        for i=1:n
            pgmax(i)=input('Enter the maximum limit of the unit:');
            pgmin(i)=input('Enter the minimum limit of the unit:');
        end
        k=0;
        for i=1:n
            if(i==k)
                i=i+1;
            else
                lm=((pd+x)/y);
                pg(i)=(lm-b(i))/(2*a(i));
                if (pg(i)<pgmin(i))
                    pg(i)=pgmin(i)
                    pd=pd-pgmin(i)
                    x=x-(b(i)/(2*a(i)))
                    y=y-(1/(2*a(i)))
                    i=1;
                    
                end
                if (pg(i)>pgmax(i))
                    pg(i)=pgmax(i)
                    pd=pd-pgmax(i)
                    x=x-(b(i)/(2*a(i)))
                    y=y-(1/(2*a(i)))
                    k=i
                    i=1;
                    
                end
            end
        end
end