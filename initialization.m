function [GA] = initialization(d2,N,D,GA,c1,t,d1,q,g,e,R,K,cIndex,mIndex)

for i = 1:N
    GA(i,1:D) = randi([1,R],[1,D]);  %编码
    %GA(i,1:D) = [1,1,1,2,2,2,2,1,2,3,1,1,2,3];
    x = decode(GA(i,:),R,D); %解码
    [GA(i,D+1),GA(i,D+2),GA(i,D+3)] = fitness(D,d2,c1,t,d1,q,g,e,x,R,K,cIndex,mIndex); %总费用计算
end