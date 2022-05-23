clear;
clf;
clc;

% Konfigurační proměnné
a = 1;
b = 0.5;
f_domain = -0.5:0.01:1;
g_domain = -0.5:0.1:2;
tolerance = 1e-12;
limit = 1000;

% Inline funkce
g = @(x)log(x + 0.5);
f = @(x) (x.^2 / a.^2) + (log(x + 0.5).^2 / b.^2) - 1;
fp = @(x) (2.*x / a^2) + (2 .* g(x)) / (b.^2 .* (x + 0.5));

% Vykreslení elipsy
clf;
hold on;
xlim([-1 1]);
ylim([-1 1]);
yline(0);
xline(0);

% Vykreslení elipsy
[e_x, e_y] = elipsa(a, b);
plot(e_x, e_y, 'r');

% Vykreslení funkce g
plot(g_domain, g(g_domain));

% Vykreslení nelineární rovnice
plot(f_domain, f(f_domain));

% Vyšetření podezřelých bodů
x1 = vysetri_bod(f, fp, g, 0, 0.2, tolerance, limit)
x2 = vysetri_bod(f, fp, g, 0.7, 0.9, tolerance, limit)

% Uložení do souboru
saveas(gcf, "graph.png");

function [x, y] = elipsa(a, b)
    t = linspace(0, 2 * pi);
    x = a * cos(t);
    y = b * sin(t);
end

function [x] = vysetri_bod(f, fp, g, a, b, tol, lim)
    [bi_x] = bisection(f, a, b, tol, lim);
    [ne_x] = newton(f, fp, a, tol, lim);
    [nd_x] = newton_diff(f, a, b, tol, lim)
    plot([bi_x ne_x nd_x], [g(bi_x) g(ne_x) g(nd_x)], '.', 'markersize', 24);
    plot([bi_x ne_x nd_x], [f(bi_x) f(ne_x) f(nd_x)], '.', 'markersize', 24);

    x = (bi_x + ne_x + nd_x) / 3;
end