clc;

Q = [1 2 3; 4 5 6; 7 8 1];
P = [1 1 2; 1+1e-16 1 2; 1 1 1];
T = [0 2 0;1 1 0;0 0 3];
A = full(gallery('lehmer',25));
S = full(gallery('poisson',10));
d = [1;1;1];

[x M] = gauss_elim(S, d)
[L U] = lu(S)
