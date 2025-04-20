function crosspop=crossover(crosspop,pop,n_sa,ncross,tol)



f=[pop.fit];
f=f./sum(f);
f=cumsum(f);

for n=1:2:ncross 
    i1=find(rand<=f,1,'first');
    i2=find(rand<=f,1,'first');

    p1=pop(i1).par;
    p2=pop(i2).par;

    
    child1rand1=rand(1,n_sa);
    k11=sort(child1rand1);
    for i=1:n_sa
        A11=find(i==p1,1);
        child1sorted(A11)=k11(i);
    end

    child1rand2=rand(1,n_sa);
    k12=sort(child1rand2);
    for i=1:n_sa
        A12=find(i==p1(n_sa+1:2.*n_sa),1);
        child1sorted(A12+n_sa)=k12(i);
    end
    child2rand1=rand(1,n_sa);
    k21=sort(child2rand1);
    for i=1:n_sa
        A21=find(i==p2,1);
        child2sorted(A21)=k21(i);
    end

    child2rand2=rand(1,n_sa);
    k22=sort(child2rand2);
    for i=1:n_sa
        A22=find(i==p2(n_sa+1:2.*n_sa),1);
        child2sorted(A22+n_sa)=k22(i);
    end
%%
    for i=1:n_sa
   
        k1=randi([1 n_sa-1]);
        k2=randi([n_sa+1 2.*n_sa-1]);

        o1=[child1sorted(1:k1) child2sorted(k1+1:n_sa) child1sorted(n_sa+1:k2) child2sorted(k2+1:2.*n_sa)];
        o2=[child2sorted(1:k1) child1sorted(k1+1:n_sa) child2sorted(n_sa+1:k2) child1sorted(k2+1:2.*n_sa)];

        [yadola, poppar]=sort(o1(1:n_sa));
        [yadola, poppar(n_sa+1:2.*n_sa)]=sort(o1(n_sa+1:2.*n_sa));

        crosspop(n).par=poppar;
        crosspop(n).fit=fitness(crosspop(n).par,n_sa,tol);

        [yadola, poppar2]=sort(o2(1:n_sa));
        [yadola, poppar2(n_sa+1:2.*n_sa)]=sort(o2(n_sa+1:2.*n_sa));
        
        crosspop(n+1).par=poppar2;
        crosspop(n+1).fit=fitness(crosspop(n+1).par,n_sa,tol);

    end

end
