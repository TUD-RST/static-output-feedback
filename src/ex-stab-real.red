% Static output feedback design
% Real stabilizability
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
% Desired characteristic polynomial (structure)
CPS:=(s-s1)*(s-s2)*(s-s3)*(s-s4);
% Coefficient matching
cond1:=for j:=0 : 3 mkand coeffn(CPS,s,j)=coeffn(CP,s,j);
% Sign condition for real stabilizability
cond2:=s1<0 and s2<0 and s3<0 and s4<0;
% Prenex formulation: Real stabilizability
phi:=ex({s1,s2,s3,s4,k11,k12,k21,k22},cond1 and cond2);
% Quantifier elimination
psi:=rlqe(phi);

