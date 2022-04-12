function [k,q] = lin_regression(x,y)
    if (isrow(x)) x = x'; end
    if (isrow(y)) y = y'; end
    
    n = numel(x);

    sumX = sum(x);
    sumX2 = sum(x.^2);
    sumXY = sum(x .* y);
    sumY = sum(y);

    jmenovatel = n * sumX2 - sumX^2;

    k = (n * sumXY - sumX * sumY) / jmenovatel; 
    q = (sumX2 * sumY - sumX * sumXY) / jmenovatel; 
end