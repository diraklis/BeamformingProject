function theta = realsymbolsangles(d,theta_0,realSymbols)

    theta=zeros(realSymbols,realSymbols);
    theta_test=zeros(1,realSymbols);
    
    for i=1:realSymbols
        theta_test(1,i)=theta_0+(i-1)*d;    
    end
    
    for j=1:realSymbols
    
        theta(j,1:realSymbols)=circshift(theta_test(1,1:realSymbols),realSymbols-j+1);
        theta(j,2:realSymbols)=sort(theta(j,2:realSymbols));
    
    end

end

