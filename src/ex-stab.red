% Static output feedback design
% Stabilizability
load_package "redlog";
% Select algebraic context: Real field
rlset r;
% Advanced elimination method (virtual substitution)
on ofsfvs;
% System matrices 
A:=mat((-1, 0, 0, 0),
        (0, -2, 0, 0),
        (0, 0, 1, 0),
        (0, 0, 0, 2));
B:=mat((1,0),
       (1,0),
       (1,1),
       (1,0));
C:=mat((1,1,1,1),
       (0,0,0,1));
% Identity matrix
Id:=A^0;
% Controller gain matrix
K:=mat((k11,k12),(k21,k22));
% Closed-loop system matrix
M:=A-B*K*C;
% Characteristic polynomial
CP:=det(s*Id-M);
% Coefficients
a0:=coeffn(CP,s,0);
a1:=coeffn(CP,s,1);
a2:=coeffn(CP,s,2);
a3:=coeffn(CP,s,3);
% Stability condition
cond:=a0>0 and a1>0 and a2>0 and a1*a2*a3-a1^2-a0*a3^2>0;
% Prenex formulation: Stabilizability
phi:=ex({k11,k12,k21,k22},cond);
% Quantifier elimination
psi:=rlqe(phi);


