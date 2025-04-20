function  crosspopmutated=mutation(crosspop,n_sa,ncross,pm,tol)

for n=1:ncross
    for j=1:n_sa-1
        if rand<=pm
            j1=crosspop(n).par(j);
            j2=crosspop(n).par(j+1);
            crosspop(n).par(j)=j2;
            crosspop(n).par(j+1)=j1;
        end
    end

    for j=1:n_sa-1
        if rand<=pm
            j1=crosspop(n).par(j+n_sa);
            j2=crosspop(n).par(j+n_sa+1);
            crosspop(n).par(j+n_sa)=j2;
            crosspop(n).par(j+n_sa+1)=j1;
        end
    end

end

crosspopmutated=crosspop;

for i=1:ncross
    crosspopmutated(i).fit=fitness(crosspop(i).par,n_sa,tol);
end

end
        