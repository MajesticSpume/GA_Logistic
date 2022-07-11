%问题：找到成本最低的网络运行方案
%编码：自然数编码
%选择：锦标赛
%交叉：顺序交叉
%变异：两个随机位置互换

clear;
clc;
close all;
tic;
%% Ⅰ通过data将数据导入,并设置相关参数
[N,D,Iter,Pc,Pm,d1,d2,q,c1,t,e,g,cIndex,mIndex] = data;

[A,B] = size(q);

[R,C] = size(d2);
[~,K] = size(e);

GA = zeros(N,D+1); %前D位置为销售中心对应的运输中心位置  D+1 位置为总费用
%%  Ⅱ 初始化
[GA] = initialization(d2,N,D,GA,c1,t,d1,q,g,e,R,K,cIndex,mIndex);
%%  Ⅲ 迭代
[GA,Gbest,fitnesses] = iteration(N,D,Iter,Pc,Pm,d2,GA,c1,t,d1,q,g,e,R,K,cIndex,mIndex);
%% Ⅳ命令行显示,并画图
[value,row] = min(GA(:,D+1));
disp(['最优方案出现在第',num2str(row),'代']);
disp(['最优方案为：',num2str(GA(row,1:D))]);
disp(['minL为：',num2str(min(GA(:,D+3)))]);
disp(['其中成本为：',num2str(GA(row,D+1)/cIndex)]);
disp(['碳排放为：',num2str(GA(row,D+2)/mIndex)]);

subplot(1,2,1)
plot(Gbest);
title("仿真结果")
xlabel("迭代次数")
ylabel("费用")

subplot(1,2,2)
plot(fitnesses);
title("适应度迭代过程")
xlabel("迭代次数")
ylabel("适应度")
toc