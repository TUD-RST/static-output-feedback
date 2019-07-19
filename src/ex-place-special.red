% Static output feedback design
% Special eigenvalue assignability
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
% Desired characteristic polynomial
CPS:=(s+1)*(s+2)*(s+3)*(s+4);
% Coefficient matching
cond:=for j:=0 : 3 mkand coeffn(CPS,s,j)=coeffn(CP,s,j);
% Prenex formulation: Special eigenvalue assignability
phi:=ex({k11,k12,k21,k22},cond);
% Quantifier elimination
psi:=rlqe(phi);

