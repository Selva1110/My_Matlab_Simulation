clc;
disp('Unsymmetrical fault analysis:');
bm=input('Enter the MVA base:');
bk=input('Enter the base kv:');
z0=input('Enter the zero seq reactance:');
z1=input('Enter the positive seq reactance:');
z2=input('Enter the negative seq reactance:');
zf=input('Enter the fault reactance:');
ib= bm/(1.732*bk);
Ea=(bk/bk);
i= sqrt(-1);
p=-0.5+(0.866*i);
q=-0.5-(0.866*i);
fprintf('\n1.Single Line to Ground Fault:\n2.Line to Line Fault:\n3.Double Line To Ground fault:\n');
a=input('Enter the choice:');
switch(a)
    case 1
        ifa=(3*Ea)/((3*zf)+z0+z1+z2)
        ia1=ifa/3;
        ia2=ia1;
        ia0=ia1;
        fprintf('\n1.Fault at c:\n2.Fault at a:\n3.Fault at b:\n');
        b=input('Enter the choice:');
    case 2
        ifa=-1*(Ea*(1.732*i)*Ea)/(z1+z2)
        ia0=0;
        ia1=Ea/(z1+z2);
        ia2=-1*(ia1);
        fprintf('\n1.Fault in a,b:\n2.Fault in b,c:\n3.Fault in c,a:\n');
        b=input('Enter the choice:');
    case 3
        ia1=(Ea*(z2+z0))/(z2*z0)+(z1*z2)+(z1*z0)
        ia0=((-Ea)+(ia1*z1))/(z0+3*zf)
        ia2=((ia1*z1)-Ea)/z2;
        ifa=3*ia0;
        fprintf('\n1.Fault bw a,b and gnd;\n2.Fault bw b,c and gnd;\n3. Fault bw c,a and gnd\n');
        b=input('Enter the choice');
end
va0=-1*(z0*ia0);
va1=Ea-(z1*ia1);
va2=-1*(z2*ia2);
va=(va0+va1+va2);
vb=(va0+(q*va1)+(p*va2));
vc=(va0+(p*va1)+(q*va2));
vab=va-vb;
vbc=vb-vc;
vca=vc-va;
vaba=(vab*bk)/sqrt(3);
vbca=(vbc*bk)/sqrt(3);
vcaa=(vca*bk)/sqrt(3);
ifac= (ifa*ib);
if(b==1)
    vca=vaba
    vab=vbca
    vbc=vcaa
elseif(b==2)
    vab=vaba
    vbc=vbca
    vca=vcaa
elseif(b==3)
    vbc=vaba
    vca=vbca
    vab=vcaa
end