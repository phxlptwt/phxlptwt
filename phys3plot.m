

clc, clearvars;

% Data Sets

init_spr1 = [213.74 232.00 251.82 270.68 290.20 309.98 329.34];
init_spr2 = [207.30 225.52 244.60 264.52 284.18 303.68 323.62];

m = [4.45 9.22 13.94 18.70 23.48 28.30]';
m_spr = [4.45 9.22 13.94 18.70 23.48 28.30]';
weight = m_spr .* 9.794;
mass = m + 129.29;
mass_u = 142.59;
spr1 = init_spr1 - 213.74;
spr2 = init_spr2 - 207.30;
spr1(1) = [];
spr2(1) = [];

spr1 = spr1';
spr2 = spr2';





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
1.04048
1.04087
1.04071];

t = [0.03172
0.01607
0.01136
0.00915
0.00689
0.00570
];

v = 19.87/2 * 10^-3 ./ t;

v_squared = v .* v .* mass_u .* 10^-3;
A_squared = A .* A .* 10^-4;

disp(mass)
disp(A_squared)

%{
% L against Weight for Spring 1

fit_spr1 = fit(spr1, weight, 'poly1');  % Linear fit for first dataset
[f, gof] = fit(spr1, weight, 'poly1');

% Equations and Coefficients
coefficients_spr1 = coeffvalues(fit_spr1);
slope_spr1 = coefficients_spr1(1);
int_spr1 = coefficients_spr1(2);
r_squared = gof.rsquare;
p_r = sign(slope_spr1) * sqrt(r_squared);


% Plotting
figure;
hold on;  % Keep all plots on same axes

scatter(spr1, weight, 'b', 'x');  % Blue circles for dataset 1
plot(fit_spr1, spr1, weight, 'b-');  % Blue line for fit 1

% Axis Titles
y_axis = 'Weight \it{G} \rm{/ \times 10^{-3} kg ms^{-2}}';
x_axis = 'Extension of the Spring \Delta\it{L} \rm{/ \times 10^{-3} m}';
title_txt = '\it{G} \rm{vs \Delta}\it{L} \rm{of Spring 1}';

legend_txt = {['\it{G} \rm{=} ', num2str(slope_spr1, '%.3f'), '\Delta\it{L} \rm{+ }', num2str(int_spr1, '%.3f')], ['R² = ', num2str(r_squared, '%.5f')], ['Pearsons r: ', num2str(p_r, '%.5f')]};

xlabel(x_axis, 'FontName','Times New Roman', 'Interpreter', 'tex');
ylabel(y_axis, 'FontName','Times New Roman', 'Interpreter','tex');
title(title_txt, 'FontName','Times New Roman', 'Interpreter','tex');
legend(legend_txt, 'Location', 'best');
grid on;
hold off;
%}

%{
% L against Weight for Spring 2

fit_spr2 = fit(spr2, weight, 'poly1');  % Linear fit for first dataset
[f, gof] = fit(spr2, weight, 'poly1');

% Equations and Coefficients
coefficients_spr2 = coeffvalues(fit_spr2);
slope_spr2 = coefficients_spr2(1);
int_spr2 = coefficients_spr2(2);
r_squared = gof.rsquare;
p_r = sign(slope_spr2) * sqrt(r_squared);


% Plotting
figure;
hold on;  % Keep all plots on same axes

scatter(spr2, weight, 'black', 'x');  % Blue circles for dataset 1
plot(fit_spr2, spr2, weight, 'r-');  % Blue line for fit 1

% Axis Titles
y_axis = 'Weight \it{G} \rm{/ \times 10^{-3} kg ms^{-2}}';
x_axis = 'Extension of the Spring \Delta\it{L} \rm{/ \times 10^{-3} m}';
title_txt = '\it{G} \rm{vs \Delta}\it{L} \rm{of Spring 2}';

legend_txt = {['\it{G} \rm{=} ', num2str(slope_spr2, '%.3f'), '\Delta\it{L} \rm{+ }', num2str(int_spr2, '%.3f')], ['R² = ', num2str(r_squared, '%.5f')], ['Pearsons r: ', num2str(p_r, '%.5f')]};

xlabel(x_axis, 'FontName','Times New Roman', 'Interpreter', 'tex');
ylabel(y_axis, 'FontName','Times New Roman', 'Interpreter','tex');
title(title_txt, 'FontName','Times New Roman', 'Interpreter','tex');
legend(legend_txt, 'Location', 'best');
grid on;
hold off;
%}

%{
% T^2 Against Mass for Horizontal Plane

fit_hp = fit(mass, T_squared_h, 'poly1');  % Linear fit for first dataset
[f, gof] = fit(mass, T_squared_h, 'poly1');

% Equations and Coefficients
coefficients = coeffvalues(fit_hp);
slope = coefficients(1);
int = coefficients(2);
r_squared = gof.rsquare;
p_r = sign(slope) * sqrt(r_squared);


% Plotting
figure;
hold on;  % Keep all plots on same axes

scatter(mass, T_squared_h, 'r', 'x');  % Blue circles for dataset 1
plot(fit_hp, mass, T_squared_h, 'black-');  % Blue line for fit 1

% Axis Titles
y_axis = 'Period Squared \it{T^2} \rm{/ s^2}';
x_axis = 'Mass of the Object \it{M_{i}} \rm{/ \times 10^{-3} kg}';
title_txt = '\it{T^2} \rm{vs} \it{M_i} \rm{of Horizontal Plane}';

legend_txt = {['\it{T^2} \rm{=} ', num2str(slope, '%.3f'), '\it{M_{i}} \rm{+ }', num2str(int, '%.3f')], ['R² = ', num2str(r_squared, '%.5f')], ['Pearsons r: ', num2str(p_r, '%.5f')]};

xlabel(x_axis, 'FontName','Times New Roman', 'Interpreter', 'tex');
ylabel(y_axis, 'FontName','Times New Roman', 'Interpreter','tex');
title(title_txt, 'FontName','Times New Roman', 'Interpreter','tex');
legend(legend_txt, 'Location', 'best');
grid on;
hold off;
%}

%{
% T^2 Against Mass for Inclined Plane
fit_ip = fit(mass, T_squared_i, 'poly1');  % Linear fit for first dataset
[f, gof] = fit(mass, T_squared_i, 'poly1');

% Equations and Coefficients
coefficients = coeffvalues(fit_ip);
slope = coefficients(1);
int = coefficients(2);
r_squared = gof.rsquare;
p_r = sign(slope) * sqrt(r_squared);


% Plotting
figure;
hold on;  % Keep all plots on same axes

scatter(mass, T_squared_i, 'black', 'x');  % Blue circles for dataset 1
plot(fit_ip, mass, T_squared_i, 'black-');  % Blue line for fit 1

% Axis Titles
y_axis = 'Period Squared \it{T^2} \rm{/ s^2}';
x_axis = 'Mass of the Object \it{M_{i}} \rm{/ \times 10^{-3} kg}';
title_txt = '\it{T^2} \rm{vs} \it{M_i} \rm{of Inclined Plane}';

legend_txt = {['\it{T^2} \rm{=} ', num2str(slope, '%.3f'), '\it{M_{i}} \rm{+ }', num2str(int, '%.3f')], ['R² = ', num2str(r_squared, '%.5f')], ['Pearsons r: ', num2str(p_r, '%.5f')]};

xlabel(x_axis, 'FontName','Times New Roman', 'Interpreter', 'tex');
ylabel(y_axis, 'FontName','Times New Roman', 'Interpreter','tex');
title(title_txt, 'FontName','Times New Roman', 'Interpreter','tex');
legend(legend_txt, 'Location', 'best');
grid on;
hold off;
%}


% T vs A for Horizontal Plane

fit_T = fit(A, T, 'poly1');  % Linear fit for first dataset
[f, gof] = fit(A, T, 'poly1');

% Equations and Coefficients
coefficients = coeffvalues(fit_T);
slope = coefficients(1);
int = coefficients(2);
r_squared = gof.rsquare;
p_r = sign(slope) * sqrt(r_squared);


% Plotting
figure;
hold on;  % Keep all plots on same axes

scatter(A, T, 'b', 'x');  % Blue circles for dataset 1
plot(fit_T, A, T);  % Blue line for fit 1

% Axis Titles
y_axis = 'Period of Oscillation \it{T} \rm{/ s}';
x_axis = 'Amplitude of Oscillation \it{A} \rm{/ \times 10^{-2} m}';
title_txt = '\it{T} \rm{vs} \it{A} \rm{of Horizontal Plane}';

legend_txt = {['\it{T} \rm{=} ', num2str(slope, '%.5f'), '\it{A} \rm{+ }', num2str(int, '%.5f')], ['R² = ', num2str(r_squared, '%.5f')], ['Pearsons r: ', num2str(p_r, '%.5f')]};

xlabel(x_axis, 'FontName','Times New Roman', 'Interpreter', 'tex');
ylabel(y_axis, 'FontName','Times New Roman', 'Interpreter','tex');
title(title_txt, 'FontName','Times New Roman', 'Interpreter','tex');
legend(legend_txt, 'Location', 'best');
grid on;
hold off;
%}


%{
% mv^2 vs A^2
fit_v = fit(A_squared, v_squared, 'poly1');  % Linear fit for first dataset
[f, gof] = fit(A_squared, v_squared, 'poly1');

% Equations and Coefficients
coefficients = coeffvalues(fit_v);
slope = coefficients(1);
int = coefficients(2);
r_squared = gof.rsquare;
p_r = sign(slope) * sqrt(r_squared);


% Plotting
figure;
hold on;  % Keep all plots on same axes

scatter(A_squared, v_squared, 'b', 'x');  % Blue circles for dataset 1
plot(fit_v, A_squared, v_squared);  % Blue line for fit 1

% Axis Titles
y_axis = 'Mass \times Instantaneous Velocity \it{mv^2_{max}} \rm{/ kg m^2s^2}';
x_axis = 'Amplitude of Oscillation Squared \it{A^2} \rm{/ m^2}';
title_txt = '\it{mv^2_{max}} \rm{vs} \it{A^2}';

legend_txt = {['\it{mv^2_{max}} \rm{=} ', num2str(slope, '%.5f'), '\it{A^2} \rm{+ }', num2str(int, '%.5f')], ['R² = ', num2str(r_squared, '%.5f')], ['Pearsons r: ', num2str(p_r, '%.5f')]};

xlabel(x_axis, 'FontName','Times New Roman', 'Interpreter', 'tex');
ylabel(y_axis, 'FontName','Times New Roman', 'Interpreter','tex');
title(title_txt, 'FontName','Times New Roman', 'Interpreter','tex');
legend(legend_txt, 'Location', 'best');
grid on;
hold off;
%}