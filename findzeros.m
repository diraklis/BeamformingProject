function angleofzeros = findzeros(theta_zeros,mins,o)

    angleofzeros=zeros(1,5);
    for i=1:5
        angleofzeros(1,i)=interp1(mins,mins,theta_zeros(o,i),'nearest','extrap');
    end
    
end

