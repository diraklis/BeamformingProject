function [sidelobes1,angleofzeros1,AF1,A11,w_nsb11] = optimizing(atheta,theta,theta_zeros,x,sidelobes,angleofzeros,AF,theta1,w_nsb1,A1,o,th,elements,bd,Pn)

    while max(sidelobes)>0.08 || max(abs(angleofzeros(1,1:5)-theta_zeros(o,1:5)))>13
        
        for k=1:elements
        for i=1:length(theta1)
            A1(k,i)=exp(1j*(k-1)*bd*cos(theta1(i)*pi/180));
        end
        end
        
        w_nsb=A1*inv( (A1')*A1+Pn*diag(ones(1,length(theta1))) );
        w_nsb1=w_nsb(1:elements,1);
        AF(1,1:end)=(w_nsb1')*atheta;
        AF(1,1:end)=abs(AF(1,1:end))/max(abs(AF(1,1:end)));
    
        [Maximums,P]=findpeaks(abs(AF(1,1:length(th))));
        Maximums=sort(Maximums);

        th_peaks=P/10;
        theta1=th_peaks;
        while theta1(1)>theta(o,1)+5 || theta1(1)<theta(o,1)-5
            theta1=circshift(theta1,-1);
        end
        theta1(2:6)=sort(theta1(2:6));

        sidelobes=Maximums(1:end-1);
        PointsofZeros=islocalmin(abs(AF( 1, 1:end )));
        mins=x(PointsofZeros)/10;
        angleofzeros=findzeros(theta_zeros,mins,o);

    end
    
    sidelobes1=sidelobes;
    angleofzeros1=angleofzeros;
    AF1=AF;
    A11=A1;
    w_nsb11=w_nsb1;

end

