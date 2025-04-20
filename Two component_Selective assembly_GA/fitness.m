function F=fitness(x,n_sa,tol)

c_max=zeros(1,n_sa);
c_min=zeros(1,n_sa);

for i=1:n_sa
    c_max(i)=tol(1).*x(i)+tol(2).*x(i+n_sa);
    c_min(i)=tol(1).*(x(i)-1)+tol(2).*(x(i+n_sa)-1);
end

cmin=min(c_min);
cmax=max(c_max);
z=cmax-cmin;

F=exp(-0.05.*z);