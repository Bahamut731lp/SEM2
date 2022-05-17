clear;
clc;

run("data.m");
syms g h c e f u;

% Symbolická funkce reprezentující výpočet vzdálenosti
q = sqrt((c - e)^2 + (f - g)^2 + (h - u)^2);
% Převod na klasickej anon matlab function handle
p = matlabFunction(q);
% Redukce argumentů na dva tří-členné vektory
d = @(a, b) p(a(1), b(1), a(2), b(2), a(3), b(3));

% Zapsání soustavy rovnic
F = @(x) [
    d(x, x1) - d1;
    d(x, x2) - d2;
    d(x, x3) - d3
];

% Vytvoření jakobínské matice ze symbolické funkce, protože se skládá z
% derivací původní funkce, a jinak než takhle to pořádně udělat nejde
Jac = jacobian(q, [c f h]);

% Za symbolické derivace dosázíme jednotlivé souřadnice satelitů (xn) a
% následně i prvky vektoru z parametru (x)
J = @(x) [
    double(subs(Jac, [c f h e g u], [x(1) x(2) x(3) x1(1) x1(2) x1(3)]));
    double(subs(Jac, [c f h e g u], [x(1) x(2) x(3) x2(1) x2(2) x2(3)]));
    double(subs(Jac, [c f h e g u], [x(1) x(2) x(3) x3(1) x3(2) x3(3)]))
];

% Spuštění Newton Raphsonovy metody
x = newton_raphson(F, J, [1 1 1]', 1e-5, 1000)