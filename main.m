function [AF,angleofzeros,angleofmax,SLL,theta_max,theta_zeros,SINR,diff_angle_zeros,diff_angle_max]=main(counter_d,counter_snr)

bd=pi;
SNR=[-10 0 10 20];
d=[6 8 10 12 14 16];

elements=24;
realSymbols=6;
limit=150-5*d-30+1;

th=0:0.1:180;

AF1=zeros(limit(counter_d),realSymbols,length(th));

angleofzeros1=zeros(limit(counter_d),6,5);
theta_zeros1=zeros(limit(counter_d),6,5);
SLL1=zeros(limit(counter_d),6);
SINR1=zeros(limit(counter_d),6);
angleofmax1=zeros(limit(counter_d),6);
theta_max1=zeros(limit(counter_d),6);

theta_0=30;
for j=1:limit(counter_d)
[AF1(j,1:realSymbols,1:length(th)),angleofzeros1(j,1:6,1:5),angleofmax1(j,1:6),SLL1(j,1:6),theta_max1(j,1:6),theta_zeros1(j,1:6,1:5),SINR1(j,1:6)] = radiationpat(SNR(counter_snr),d(counter_d),elements,realSymbols,bd,theta_0);

theta_0=theta_0+1;

end
o=1;


AF=zeros(limit(counter_d)*realSymbols,length(th));

angleofzeros=zeros(limit(counter_d)*realSymbols,5);
theta_zeros=zeros(limit(counter_d)*realSymbols,5);

angleofmax=zeros(1,limit(counter_d)*realSymbols);
theta_max=zeros(1,limit(counter_d)*realSymbols);

SLL=zeros(1,limit(counter_d)*realSymbols);
SINR=zeros(1,limit(counter_d)*realSymbols);
for j=1:limit(counter_d)
    for k=1:realSymbols
        AF(o,1:1801)=AF1(j,k,1:1801);
        angleofzeros(o,1:5)=angleofzeros1(j,k,1:5);
        theta_zeros(o,1:5)=theta_zeros1(j,k,1:5);
        angleofmax(o)=angleofmax1(j,k);
        SLL(o)=SLL1(j,k);
        SINR(o)=SINR1(j,k);
        theta_max(o)=theta_max1(j,k);
        o=o+1;
    end
end

diff_angle_zeros=abs(theta_zeros-angleofzeros);
diff_angle_max=abs(angleofmax-theta_max);


theta_0=(theta_max)';
theta_1=theta_zeros(1:length(theta_zeros),1);
theta_2=theta_zeros(1:length(theta_zeros),2);
theta_3=theta_zeros(1:length(theta_zeros),3);
theta_4=theta_zeros(1:length(theta_zeros),4);
theta_5=theta_zeros(1:length(theta_zeros),5);
Delta_theta_0=diff_angle_max';
Delta_theta_1=diff_angle_zeros(1:length(theta_zeros),1);
Delta_theta_2=diff_angle_zeros(1:length(theta_zeros),2);
Delta_theta_3=diff_angle_zeros(1:length(theta_zeros),3);
Delta_theta_4=diff_angle_zeros(1:length(theta_zeros),4);
Delta_theta_5=diff_angle_zeros(1:length(theta_zeros),5);
sll=abs(SLL');
sinr=SINR';

T = table(theta_0,theta_1,theta_2,theta_3,theta_4,theta_5,Delta_theta_0,Delta_theta_1,Delta_theta_2,Delta_theta_3,Delta_theta_4,Delta_theta_5,sll,sinr);
writetable(T,'AoAdev_SINR_SLL.txt');


end

