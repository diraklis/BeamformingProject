function  [AF,angleofzeros,angleofmax,SLL,theta_max,theta_zeros,SINR] = radiationpat(SNR,d,elements,realSymbols,bd,theta_0)

Pn=1/10^(SNR/10);
th=0:0.1:180;
x=0:1800;

theta=realsymbolsangles(d,theta_0,realSymbols);

theta_max=theta(1:6,1);
theta_zeros=theta(1:6,2:6);

AF=zeros(length(theta),length(th));

angleofmax=zeros(1,6);
angleofzeros=zeros(6,5);
SLL=zeros(1,6);
SINR=zeros(1,6);
A=zeros(elements,realSymbols);


for o=1:length(theta)
    
    for k=1:elements
    for i=1:realSymbols
        A(k,i)=exp(1j*(k-1)*bd*cos(theta(o,i)*pi/180));%allakse onoma
    end
    end
    
    atheta=zeros(elements,length(th));%allakse onoma
    
    for i=1:elements
        atheta(i,1:length(th))=exp(1j*(i-1)*bd*cos(th*pi/180));
    end
    w_nsb=A*inv( (A')*A+Pn*diag(ones(1,6)) );
    w_nsb1=w_nsb(1:elements,1);
    
    AF(o,1:end)=(w_nsb1')*atheta;
    AF(o,1:end)=abs(AF(o,1:end))/max(abs(AF(o,1:end)));
    
    [Maximums,P]=findpeaks(abs(AF(o,1:length(th))));
    Maximums=sort(Maximums);

    th_peaks=P/10;
    theta1=th_peaks;

    while theta1(1)>theta(o,1)+5 || theta1(1)<theta(o,1)-5
        theta1=circshift(theta1,-1);
    end

    theta1(2:6)=sort(theta1(2:6));
    A1=zeros(elements,length(theta1));
    for k=1:elements
    for i=1:length(theta1)
        A1(k,i)=exp(1j*(k-1)*bd*cos(theta1(i)*pi/180));
    end
    end
    
    w_nsb=A1*inv( (A1')*A1+Pn*diag(ones(1,length(theta1))) );
    w_nsb1=w_nsb(1:elements,1);
    AF(o,1:end)=(w_nsb1')*atheta;
    AF(o,1:end)=abs(AF(o,1:end))/max(abs(AF(o,1:end)));

    sidelobes=Maximums(1:length(Maximums)-1);
    PointsofZeros=islocalmin(abs(AF( o, 1:end )));
    
    mins=x(PointsofZeros)/10;
    angleofzeros(o,1:end)=findzeros(d,theta_zeros,mins,o);
    [sidelobes,angleofzeros(o,1:end),AF(o,1:end),A1,w_nsb1] = optimizing(atheta,theta,theta_zeros,x,sidelobes,angleofzeros(o,1:end),AF(o,1:end),theta1,w_nsb1,A1,o,th,elements,bd,Pn,d);
    
    
    [~,angleofmax(o)]=max(AF(o,1:end));
    angleofmax(o)=angleofmax(o)/10;

    SLL(o)=-20*log10(max(Maximums)/max(sidelobes));
    
    Ai=A1(1:elements,2:end);
    ad=A1(1:elements,1);
    Rgigi=1;
    numer=(w_nsb1')*(ad)*(ad')*w_nsb1;
    denom=(w_nsb1')*(Ai)*Rgigi*(Ai')*w_nsb1 +Pn*(w_nsb1')*w_nsb1;
    SINR(o)=abs(10*log10((numer)/(denom)));
    
end

end



%     while (max(sidelobes)>0.1 || min(abs(angleofzeros(o,1:5)-theta_zeros(o,1:5)))>10)
%         
% 
%         th_peaks=P/10;
%         theta1=th_peaks;
%         while theta1(1)>theta(o,1)+5 || theta1(1)<theta(o,1)-5
%             theta1=circshift(theta1,-1);
%         end
%         theta1(2:6)=sort(theta1(2:6));
% 
%         A1=zeros(elements,length(theta1));
%     
%         for k=1:elements
%         for i=1:length(theta1)
%             A1(k,i)=exp(1j*(k-1)*bd*cos(theta1(i)*pi/180));
%         end
%         end
%         
%         w_nsb=A1*inv( (A1')*A1+Pn*diag(ones(1,length(theta1))) );
%         w_nsb1=w_nsb(1:elements,1);
%         AF(o,1:length(th))=(w_nsb1')*atheta;
%         AF(o,1:length(th))=abs(AF(o,1:length(th)))/max(abs(AF(o,1:length(th))));
%     
%         [Maximums,P]=findpeaks(abs(AF(o,1:length(th))));
%         Maximums=sort(Maximums);
%         sidelobes=Maximums(1:length(Maximums)-1);
%         PointsofZeros=islocalmin(abs(AF( o, 1:length(th)) ));
%         mins=x(PointsofZeros)/10;
%         angleofzeros=findzeros(d,theta_zeros,mins);
%     end

%     PointsofZeros=islocalmin(abs(AF( o, 1:length(th)) ));
%     mins=x(PointsofZeros)/10;
%     angleofzeros=findzeros(d,theta_zeros,mins);
