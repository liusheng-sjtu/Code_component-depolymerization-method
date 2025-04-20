clc
clear all
for kkk=2:10
n_sa=kkk;
Ta=0.24/3;
Tb=0.47/3;
Tc=0.14/3;
tol=[Ta/n_sa Tb/n_sa Tc/n_sa];

n_pop=100;
maxiter=2000;

pc=0.6 
ncross=2.*round(n_pop*pc/2);

pm=0.08;
nmut=round(n_pop*pm);
%%

tic
empty.par=[];
empty.fit=[];

pop=repmat(empty,n_pop,1);

for i=1:n_pop
    pop(i).par=[randperm(n_sa) randperm(n_sa) randperm(n_sa)];
    pop(i).fit=fitness(pop(i).par,n_sa,tol);
end

BEST=zeros(maxiter,1);
Mean=zeros(maxiter,1);

for iter=1:maxiter
    
    crosspop=repmat(empty,ncross,1);
    crosspop=crossover(crosspop,pop,n_sa,ncross,tol);

    
    crosspopmutated=mutation(crosspop,n_sa,ncross,pm,tol);

    
    [pop]=[pop;crosspopmutated];

    
    [~,index]=sort([pop.fit],'descend');
    pop=pop(index); 
    pop=pop(1:n_pop);
    
    gpop=pop(1);   
    
    
    
    BEST(iter)=-(log(gpop.fit))./0.05;        
    MEAN(iter)=-(log(mean([pop.fit]))./0.05);  

    if iter>1000 && BEST(iter)==BEST(iter-1000)
        break
    end    
end

permbest=gpop.par;
fitbest=-(log(gpop.fit))./.05;
fitbest_all(kkk)=fitbest;
[F_max,F_min]=worst_value(permbest,n_sa,tol,Ta,Tb,Tc)
BEST_all(:,kkk)=BEST;
end
AA=(1:1001);
AAA=AA';
BEST_all=BEST_all(1:1001,:);
BEST_all(:,1)=AAA;


figure(1)
plot(BEST(1:iter),'r','LineWidth',2)
hold on
plot(MEAN(1:iter),'b','LineWidth',2)


xlabel('Iteration')
ylabel(' Fitness')

legend('BEST','MEAN')


title('GA for Selective Assembly')