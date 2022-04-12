clear;

A = full(gallery('poisson',5));
title('Konvergence rezidua');
xlabel('Počet iterací');
ylabel('Reziduum');
hold on;

[x,flag,rr,it,rv] = jacobi(A, ones(25, 1), 1e-17, 1000);
if (flag ~= 4)
    semilogx(rv, 'DisplayName','Jacobi');
end

[x,flag,rr,it,rv] = gauss_seidel(A, ones(25, 1), 1e-17, 1000);
if (flag ~= 4)
    semilogx(rv, 'DisplayName','Gauss Seidel');
end

[x,flag,rr,it,rv] = pcg(A, ones(25, 1), 1e-17, 1000);
if (flag ~= 4)
    semilogx(rv, 'DisplayName','PCG');
end

legend('Location','northeastoutside')
saveas(gcf, "graph_poisson.png");
clf;
clear;

A = full(gallery('lehmer',20));
title('Konvergence rezidua');
xlabel('Počet iterací');
ylabel('Reziduum');
hold on;

[x,flag,rr,it,rv] = jacobi(A, ones(20, 1), 1e-17, 1000);
if (flag ~= 4)
    semilogx(rv, 'DisplayName','Jacobi');
end

disp(flag);

[x,flag,rr,it,rv] = gauss_seidel(A, ones(20, 1), 1e-17, 1000);
if (flag ~= 4)
    semilogx(rv, 'DisplayName','Gauss Seidel');
end

disp(flag);

[x,flag,rr,it,rv] = pcg(A, ones(20, 1), 1e-17, 1000);
if (flag ~= 4)
    semilogx(rv, 'DisplayName','PCG');
end

disp(flag);

legend('Location','northeastoutside')
saveas(gcf, "graph_lehmer.png");
clf;
clear;

A = full(gallery('dorr',5));
title('Konvergence rezidua');
xlabel('Počet iterací');
ylabel('Reziduum');
hold on;

[x,flag,rr,it,rv] = jacobi(A, ones(5, 1), 1e-17, 1000);
if (flag ~= 4)
    semilogx(rv, 'DisplayName','Jacobi');
end

[x,flag,rr,it,rv] = gauss_seidel(A, ones(5, 1), 1e-17, 1000);
if (flag ~= 4)
    semilogx(rv, 'DisplayName','Gauss Seidel');
end

[x,flag,rr,it,rv] = pcg(A, ones(5, 1), 1e-17, 1000);
if (flag ~= 4)
    semilogx(rv, 'DisplayName','PCG');
end

legend('Location','northeastoutside')
saveas(gcf, "graph_dorr.png");
hold off;
clf;
