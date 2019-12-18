clc;
fprintf('1.Symentrical Components to Phasor Component \n2. Phasor component to symentrical component:\n');
ch=input('Enter the Choice:');
i=sqrt(-1);
switch(ch)
    case 1
        mia0=input('Enter the Magnitude of Zero sequence Current:');
        aia0=input('Enter the Angle of Zero sequence Current:');
        mia1=input('Enter the Magnitude of positive sequence Current:');
        aia1=input('Enter the Angle of positive sequence Current:');
        mia2=input('Enter the Magnitude of negative sequence Current:');
        aia2=input('Enter the Angle of negative sequence Current:');
        [x1,x2]=pol2cart(aia0*pi/180,mia0);
        [y1,y2]=pol2cart(aia1*pi/180,mia1);
        [z1,z2]=pol2cart(aia2*pi/180,mia2);
        x=(x1+(x2*i));
        y=(y1+(y2*i));
        z=(z1+(z2*i));
        ia=x+y+z;
        ib=x+y*(-0.5-0.866*i)+z*(-0.5+0.866*i);
        ic=x+z*(-0.5-0.866*i)+y*(-0.5+0.866*i);
        ia
        ib
        ic
    case 2
        mia=input('Enter the Magnitude of Current in Phase A:');
        aia=input('Enter the Angle of Current in Phase A:');
        mib=input('Enter the Magnitude of Current in Phase B:');
        aib=input('Enter the Angle of Current in Phase B:');
        mic=input('Enter the Magnitude of Current in Phase C:');
        aic=input('Enter the Angle of Current in Phase C:');
        [x1,x2]=pol2cart(aia*pi/180,mia);
        [y1,y2]=pol2cart(aib*pi/180,mib);
        [z1,z2]=pol2cart(aic*pi/180,mic);
        x=(x1+(x2*i));
        y=(y1+(y2*i));
        z=(z1+(z2*i));
        ia0=(1/3)*(x+y+z);
        i2=(1/3)*(x+(y)*(-0.5-0.866*i)+(z)*(-0.5+0.866*i));
        i1=(1/3)*(x+z*(-0.5-0.866*i)+y*(-0.5+0.866*i));
        ia0
        i1
        i2
end