clear;
clc;

f = @(x) sin(x) ./ x;
g = @(x) 2*x + 1;
h = @(x) (1/2 + cos(x)) .* sin(x);

integralF_value = integral(f, 0, 1);
resolutions = arrayfun(@(x) 10^x, 1:6);
results = arrayfun(@(n) composite_midpoint(f, 0, 1, n), resolutions);
diffs = integralF_value - results;

CMR = array2table([resolutions', results', diffs'], "VariableNames",{'Resolution', 'Approximation', 'Error'})

trapz_resolutions = zeros(1, 2);
trapz_results = zeros(1, 2);
trapz_errors = zeros(1, 2);

integralG_value = integral(g, -1, 1)
[I, k] = adapt_trapz(g, -1, 1, 1000, 1e-12)


integralH_value = integral(h, 0, 1);
[J, m] = adapt_trapz(h, 0, 1, 1000, 1e-4)

array2table([[k m]', [I J]', ([I J] - [integralG_value integralH_value])'], "VariableNames",{'Resolution', 'Approximation', 'Error'})
