function [F_max,F_min]=worst_value(x,n_sa,tol,Ta,Tb,Tc)

Final_max=zeros(1,n_sa);
Final_min=zeros(1,n_sa);

for i=1:n_sa
    Final_max(i)=tol(1).*x(i)+tol(2).*x(i+n_sa)+tol(3).*x(i+2*n_sa);
    Final_min(i)=tol(1).*(x(i)-1)+tol(2).*(x(i+n_sa)-1)+tol(3).*(x(i+2*n_sa)-1);
end

F_min=min(Final_min)-Ta/2-Tb/2-Tc/2;
F_max=max(Final_max)-Ta/2-Tb/2-Tc/2;
