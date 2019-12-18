clc;
pm1=input('Enter the maximum Capacity of the line:');
pi=input('Enter the value of power flow during prefault condition:');
pm2=input('Enter the value of power flow during fault condition:');
pm3=input('Enter the value of power flow during postfault condition:');
k1=pm2/pm1;
k2=pm3/pm1;
d0=asind(pi/pm1);
d1=asind(sind(d0)/k2);
dm=180-d1;
dc=acosd(((sind(d0))*((dm-d0)*0.0175)-k1*cosd(d0)+k2*cosd(dm))/(k2-k1));
abs (dc)
