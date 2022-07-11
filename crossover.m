function x = crossover(N,D,Pc,GA,Parent1,Parent2)
%顺序交叉
x = GA;
for i = 1:N
    parent1 = Parent1(i,:);
    parent2 = Parent2(i,:);%分别选择两个父代群中的第i个染色体进行交叉
    if rand>Pc
        x(i,:) = parent1;
        if parent1(D+1)>parent2(D+1)
            x(i,:) = parent2;%当随机数大于交叉概率，选择两个父代中距离最短的那个继承下来；
        end
    else%当随机数小于交叉概率时，进行交叉操作
        point = randperm(D,2);
        point1 = min(point);
        point2 = max(point);%指定大小交叉点
        while max(point)-min(point)>=5
            %交叉点之间的距离≥5则交叉不会产生变化
            point = randperm(D,2);%随机选择1-D范围内的两个不同的整数
            point1 = min(point);
            point2 = max(point);%指定大小交叉点
        end
        x(i,point1:point2) = parent1(point1:point2);%子代交叉点之间是父代1交叉点之间的序号
        parent2_1 = [parent2(point2+1:D) parent2(1:point2)];%父代2从交叉点2后一位开始循环一轮到该交叉点
        parent2_1(point1:point2) = []; %将交叉点1到交叉点2之间的序号赋值为空
        if point1 == 1
            x(i,point2+1:D) = parent2_1;%如果交叉点1是第二位，那直接赋值
        elseif point2 ==D
            x(i,1:point1-1) = parent2_1;%如果交叉点2是最后一位，也可以直接赋值
        else
            x(i,1:point1-1) = parent2_1(1:point1-1);%交叉点前的一段序号赋值
            x(i,point2+1:D) = parent2_1(point1:end);%交叉点后的一段序号赋值
        end
    end
end