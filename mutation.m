function x = mutation(N,D,Pm,GA)
%变异
x = GA;
for i = 1:N
    if rand <= Pm%随机数小于变异概率则进行变异操作
        point1 = 0;
        point2 = 0;
        while point1 == point2%避免两个变异点相同
           point = randi([1,D],1,2);%产生2-D之间的两个不同的随机整数
           point1 = min(point);
           point2 = max(point);%两个变异点根据大小赋值
        end
        temp = x(i,point1);
        x(i,point1) = x(i,point2);
        x(i,point2) = temp;%两个变异点互换位置
    end   
end