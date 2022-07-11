function [GA,Gbest,fitnesses] = iteration(N,D,Iter,Pc,Pm,d2,GA,c1,t,d1,q,g,e,R,K,cIndex,mIndex)
Gbest = zeros(1,Iter);%存放每次迭代的最佳距离值
fitnesses = zeros(1,Iter);
for iter = 1:Iter
    %轮盘赌方案最终费用过于不稳定，不收敛，故用锦标赛
    
    Parent1 = select(N,D,GA);
    Parent2 = select(N,D,GA); %分别通过锦标赛选择两个父代群
    
    GA = crossover(N,D,Pc,GA,Parent1,Parent2);%交叉操作
    
    GA = mutation(N,D,Pm,GA);%变异操作
    for i = 1:N 
       x = decode(GA(i,1:D),R,D); % 解码
       [GA(i,D+1),GA(i,D+2),GA(i,D+3)] = fitness(D,d2,c1,t,d1,q,g,e,x,R,K,cIndex,mIndex); %总费用计算
    end
    Gbest(1,iter) = min(GA(:,D+3));
    fitnesses(1,iter) = 1000/Gbest(1,iter);  %计算适应度
    disp(['第',num2str(iter),'代种群中，其最优方案为：',num2str(GA(R,1:D))]);
    disp(['最终花费：',num2str(min(GA(:,D+3)))]);
end
