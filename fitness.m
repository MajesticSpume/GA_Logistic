function [f1,f2,y] = fitness(D,d2,c1,t,d1,q,g,e,x,R,K,cIndex,mIndex)

f1 = 0;  %成本
f2 = 0;  %碳排放



for i = 1:R 
    for j = 1:D
        f1 = f1  +  cIndex*c1(1)*d2(i,j)*q(j)*x(i,j);
    end
end

for i = 1:R 
    for j = 1:D
       for k=1:K   
          f1 = f1 + cIndex*c1(k)*t(k)*d1(i,k)*q(j)*x(i,j);
       end
    end
end

for j = 1:D
    f1 = f1 + +cIndex*g*q(j);
end

for i =1:R   %运输中心
     for j=1:D  %销售中心
        for k=1:K    %运输种类
            f2 = f2 + mIndex*e(k)*t(k)*d1(i,k)*q(j)*x(i,j);
        end
    end
end

for i = 1:R 
    for j = 1:D
        f2 = f2  +  mIndex*e(1)*d2(i,j)*q(j)*x(i,j);
    end
end
 

%计算总费用
y = f1 + f2;
