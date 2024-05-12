function angleofzeros = findzeros(d,theta_zeros,mins,o)

    angleofzeros=zeros(1,5);

        if d==6
            for i=1:5
            
                if min(abs(mins-theta_zeros(o,i) ))<15
            
                    [~,index]=min(abs(mins-theta_zeros(o,i) ));
                    angleofzeros(1,i)=mins(1,index);
                    
                    if angleofzeros(1,i)>=theta_zeros(o,i)-1 && index>1
                        if abs(theta_zeros(o,i)-mins(1,index-1))<15
                            angleofzeros(1,i)=mins(1,index-1);
                        end
                    end
                    
                    mins(mins==angleofzeros(1,i))=[];
                end
            
            end
        else
            for i=1:5
                angleofzeros(1,i)=interp1(mins,mins,theta_zeros(o,i),'nearest');
                mins(mins==angleofzeros(1,i))=[];
            end
    
        end

end

