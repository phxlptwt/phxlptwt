% Welcome to phys4plot.m 🤔
% This file contains the code for the plots in the report for Speed of Sound Calculations.

clc, clearvars;

% Data Sets (Transposed)

n = [1
2
3
4
5
6
7
8
9
10
11
12
];

L1 = [44.530
49.560
54.245
59.060
63.965
68.650
73.555
78.620
83.290
88.120
92.980
97.760
];

L2 = [49.390
59.045
68.655
78.390
88.040
97.615
107.260
116.960
126.465
136.260
145.920
155.560
];


L3 = [10.00
11.00
12.00
13.00
14.00
15.00
16.00
17.00
18.00
19.00
20.00
21.00
];

t = [64.8
70.4
78.4
85.2
91.6
98.0
105.0
111.0
118.0
125.0
132.0
139.0
];

% Axis Titles
x_axis = 'Distance between Transducers \it{S_1} \rm{and} \it{S_2} \it{L} \rm{/ \times 10^{-2} m}';
y_axis = 'Propagation Time from \it{S_1} \rm{to} \it{S_2} \it{t} \rm{/ \times 10^{-6} s}';
title_txt = '\it{t} \rm{vs} \it{L}';
var_y = '\it{t} \rm{=} ';
var_x = '\it{L} \rm{+ }';

linearFit(L3, t, x_axis, y_axis, title_txt, var_y, var_x);


function [SE, CI_lower, CI_upper] = getRegressionStats(x, y)
    % Perform linear regression
    p = polyfit(x(:), y(:), 1);
    y_fit = polyval(p, x);
    residuals = y - y_fit;
    
    % Number of observations
    n = length(x);
    
    % Standard error of the estimate (root mean squared error)
    SE = sqrt(sum(residuals.^2) / (n - 2));  % For the regression line
    
    % Standard error of the slope (if needed)
    x_mean = mean(x);
    Sxx = sum((x - x_mean).^2);
    SE_slope = SE / sqrt(Sxx);  % Standard error of the slope
    
    % 95% confidence interval for the slope
    t_val = tinv(0.975, n - 2);  % t-value for 95% CI (2-tailed)
    slope = p(1);
    CI_lower = slope - t_val * SE_slope;
    CI_upper = slope + t_val * SE_slope;
end

function linearFit(x, y, x_axis, y_axis, title_txt, var_y, var_x)

% With:
p = polyfit(x, y, 1);  % p(1) = slope, p(2) = intercept
y_fit = polyval(p, x);

% Equations and Coefficients
slope = p(1);
int = p(2);
y_mean = mean(y);
ss_tot = sum((y - y_mean).^2);
ss_res = sum((y - y_fit).^2);
r_squared = 1 - (ss_res / ss_tot);
p_r = sign(p(1)) * sqrt(r_squared);
[SE, CI_lower, CI_upper] = getRegressionStats(x, y);

% Plotting
figure;
hold on;  % Keep all plots on same axes

scatter(x, y, 'black', 'x');  % Blue circles for dataset 1
plot(x, y_fit, 'b-');  % Blue line for fit 1

legend_txt = {[var_y, num2str(slope, '%.3f'), var_x, num2str(int, '%.3f')], ['R² = ', num2str(r_squared, '%.5f')]};

disp('Pearsons r:');
disp(p_r);
disp('Standard Error:');
disp(SE);
disp('95% Confidence Interval:');
disp([CI_lower, CI_upper]);

xlabel(x_axis, 'FontName','Times New Roman', 'Interpreter', 'tex');
ylabel(y_axis, 'FontName','Times New Roman', 'Interpreter','tex');
title(title_txt, 'FontName','Times New Roman', 'Interpreter','tex');
legend(legend_txt, 'Location', 'best', 'FontSize', 8);
grid on;
hold off;
end