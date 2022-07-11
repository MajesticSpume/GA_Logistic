function x = decode(GA,R,D)
%解码
    x = zeros(R,D);
   
    for a=1:D
        row = GA(1,a);
        if(row == 1 || 2 || 3)
                x(row,a) = 1;
        end
    end
    
    
end