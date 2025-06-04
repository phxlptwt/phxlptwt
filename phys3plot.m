

clc, clearvars;


% spr1 = [213.74 232.00 251.82 270.68 290.20 309.98 329.34]';
% spr2 = [207.30 225.52 244.60 264.52 284.18 303.68 323.62]';

m = [4.45 9.22 13.94 18.70 23.48 28.30]';

T_squared_h = [1.08277
1.12176
1.16027
1.19920
1.23783
1.27701
];

T_squared_i = [1.08343
1.12210
1.16058
1.19913
1.23779
1.27713
];

A = [5.0
10.0
15.0
20.0
25.0
30.0
];

T = [1.04161
1.04103
1.04102
1.04084
1.04087
1.04071];

% Create fits
fit1 = fit(m, T_squared_h, 'poly1');  % Linear fit for first dataset
fit2 = fit(m, T_squared_i, 'poly1');  % Linear fit for second dataset

% Equations and Coefficients

coefficients1 = coeffvalues(fit1);
slope1 = coefficients1(1);
int1 = coefficients1(2);

coefficients2 = coeffvalues(fit2);
slope2 = coefficients2(1);
int2 = coefficients2(2);

% Plot everything on same axes
figure;
hold on;  % Keep all plots on same axes

% Plot raw data
scatter(m, T_squared_h, 'b', 'filled');  % Blue circles for dataset 1
scatter(m, T_squared_i, 'r', 'filled');  % Red circles for dataset 2

% Plot fitted lines
plot(fit1, 'b-');  % Blue line for fit 1
plot(fit2, 'r-');  % Red line for fit 2

% Customize plot
x_axis = 'Added Mass \it{M_{i}} \rm{/ \times 10^{-3} kg}'
y_axis = 'Period of Oscillation \it{T^{2}} \rm{/ s}'
title_txt = '\it{T^{2}} \rm{vs} \it{M_{i}}'

xlabel(x_axis, 'FontName','Times New Roman', 'Interpreter', 'tex');
ylabel(y_axis, 'FontName','Times New Roman', 'Interpreter','tex');
title(title_txt, 'FontName','Times New Roman', 'Interpreter','tex');
legend('Horizontal Plane', 'Inclined Plane');
grid on;
hold off;