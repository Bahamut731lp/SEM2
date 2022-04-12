clc;
clear;

generateGraph("data0");
generateGraph("data1");
generateGraph("data2");
generateGraph("data3");

function [] = generateGraph(filename)
    % Načtení dat ze souboru
    data = load(filename + ".mat", '-ascii');
    x = data(:, 1);
    y = data(:, 2);
    
    % Nastavení grafu
    hold on;
    title('Interpolace datasetu ' + filename);
    xlabel('Vstupní hodnoty');
    ylabel('Interpolované funkční hodnoty');
    legend('Location','bestoutside');
    ylim([-20 20])

    % Vypočítání interpolace
    xq = -5:0.5:5;
    yq = lagrange(data(:, 1), data(:, 2), xq);

    l_yq = interp1(x, y, xq, "linear");
    s_yq = interp1(x, y, xq, "spline");
    p_yq = interp1(x, y, xq, "pchip");
    m_yq = interp1(x, y, xq, "makima");
    
    % Vykreslení grafu
    plot(xq, yq, "DisplayName", "Lagrangeova interpolace");
    plot(xq, l_yq, "DisplayName", "Lineární interpolace");
    plot(xq, s_yq, "DisplayName", "Spline");
    plot(xq, p_yq, "DisplayName", "PCHIP");
    plot(xq, m_yq, "DisplayName", "Makima");

    saveas(gcf, "graph_"+ filename +".png");

    hold off;
    clf;

end