function [x, k] = newton_raphson(f,J,x0,tol,maxit)
%
% Newton-Raphson method for solution of system of nonlinear equations.
%
% Input:
% f ... multi-parametric function f(x), x being a column vector
% J ... Jacobi matrix
% x0 ... initial guess
% tol ... residuum tolerance
% maxit ... maximal number of iterations
%
% Output:
% x ... found solution
% k ... number iterations
%

k = 0;
x = x0;
res = norm(f(x));

fprintf('   k     |gradL|\n');
while (res > tol && k < maxit)
  k = k + 1;
  fx = f(x);
  r = J(x)\fx;
  x = x - r;
  res = norm(fx);
  fprintf('%4d %10g\n', k, res);
end
end