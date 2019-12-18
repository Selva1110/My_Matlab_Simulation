disp('unsymmetrical fault analysis');
bm=input('enter the MVA base');
bk=input('enter the base kv');
z0=input('enter the zero seq reactance');
z1=input('enter the positive seq reactance');
z2=input('enter the negative seq reactance');
zf=input('enter the fault reactance');
Ifb= bm/(1.732*bk);
Ea=(bk/bk);
i= sqrt(-1);
p=-0.5+(0.866*i);
q=-0.5-(0.866*i);
a=input('enter the choice');
switch(a)
    case 1
        If=(3*Ea)/((3*If)+z0+z1+z2)
        ia1=If/3;
        ia2=ia1;
        ia0=ia1;
        disp('1.fault at c; 2.fault at a;3.fault at b');
        b=input('enter the choice');
    case 2
        If=-1*(Ea*(1.732*i)*Ea)/(z1+z2)
        ia0=0;
        ia1=Ea/(z1+z2);
        ia2=-1*(ia1);
        disp('1.fault in a,b;2.fault in b,c;3.fault in c,a;');
        b=input('enter the choice');
    case 3
        ia1=(Ea*(z2+z0))/(z2*z0)+(z1*z2)+(z1*z0)
        ia0=((-Ea)+(ia1*z1))/(z0+3*zf)
        ia2=((ia1*z1)-Ea)/z2;
        If=3*ia0;
        disp('1.fault bw a,band gnd;2.fault bw b,c and gnd;3. fault bw c,a and gnd');
        b=input('enter the choice');
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
Ifa= (If*ib);
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
    