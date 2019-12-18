clc;
display('Per Unit Computation of Power System Components');
k=input('Enter the Number of Elements:');
mvab=input('Enter the Base MVA:');
kvb=input('Enter the base KV:');
pu=zeros(k);
for i=1:1:k
   ch=input('Enter the Component 1.Generator 2.Transformer 3.Load 4.Transmission Line');
   switch(ch)
       case 1
           mva=input('Enter the MVA of Generator:');
           kv=input ('Enter the KV of Generator:');
           x=input('Enter the Sub-Transiant Reactance of Generator:');
           pu(i)=x*(kv/kvb)*(kv/kvb)*(mvab/mva);
       case 2
           t=input('Enter the type of Transformer: 1.Step Up Transformer 2.Distribution Transformer');
           if (t==1)
           mva=input('Enter the MVA of Transformer:');
           hkv=input ('Enter the HV side KV of Transformer:');
           lkv=input ('Enter the LV side KV of Transformer:');
           x=input('Enter the Sub-Transiant Reactance of Transformer:');
           kvbn=(hkv/lkv)*kvb
           pu(i)=x*(lkv/kvb)*(lkv/kvb)*(mvab/mva);
           end
           if(t==2)
           mva=input('Enter the MVA of Transformer:');
           hkv=input ('Enter the HV side KV of Transformer:');
           lkv=input ('Enter the LV side KV of Transformer:');
           x=input('Enter the Sub-Transiant Reactance of Transformer:');
           k=lkv/hkv;
           kvbn=k*kvbn;
           pu(i)=x*(lkv/kvbn)*(lkv/kvbn)*(mvab/mva);
           end
       case 3
           mva=input('Enter the MVA of Load:');
           kv=input ('Enter the KV of Load:');
           x=input('Enter the Sub-Transiant Reactance of Load:');
           pu(i)=x*(kv/kvbn)*(kv/kvbn)*(mvab/mva);
       case 4
           kv=input ('Enter the KV of Line:');
           x=input('Enter the Sub-Transiant Reactance of Line:');
           pu(i)=x/(kvbn*kvbn/mvab);
       otherwise
           disp('Enter the correct Choice');
   end
end
pu
           
           