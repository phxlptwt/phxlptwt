% this is phys5plot.m

% Example data (replace with your actual data)

clc, clearvars;

T_1 = [
    15.228
15.370
15.525
15.580
15.682
15.704
15.750
15.784
15.840
15.868
15.915
16.000
16.069
16.165
16.326
16.489
16.655
];

T_2 = [
    15.190
15.347
15.508
15.581
15.670
15.699
15.742
15.781
15.830
15.857
15.907
15.995
16.070
16.159
16.319
16.484
16.652
];

theta1 = [
    47
61
83
95
126
131
139
142
140
136
129
115
103
87
67
53
43
];

phi1 = [
    162
156
145
131
145
113
99
93
80
73
65
54
46
39
28
22
19
];

theta2 = [
    45
57
77
91
113
121
127
131
131
131
130
125
111
85
66
53
43
];

phi2 = [
    160
156
145
137
122
114
105
96
85
79
71
57
49
40
30
24
20
];

omega1 = 15.808 ./ T_1;
omega2 = 15.808 ./ T_2;

disp(omega1);
disp(omega2);
%{
function plot_theta(x_data, A_data)
    % Define the fit model based on the provided equation
    fitModel = fittype('mu ./ sqrt( (1 - x.^2).^2 + 4*beta^2*x.^2 )', ...
                    'independent', 'x', ...
                    'coefficients', {'mu', 'beta'});

    % Initial guesses
    mu_guess = max(A_data);
    beta_guess = 0.1;

    % Perform the fit
    [fitResult, gof] = fit(x_data, A_data, fitModel, ...
                        'StartPoint', [mu_guess, beta_guess]);

    % Generate fitted curve
    x_fit = linspace(min(x_data), max(x_data), 1000);
    A_fit = fitResult.mu ./ sqrt( (1 - x_fit.^2).^2 + 4*fitResult.beta^2*x_fit.^2 );

    % Plot
    figure;
    plot(x_data, A_data, 'x', 'DisplayName', 'Data'); hold on;
    plot(x_fit, A_fit, 'r-', 'DisplayName', 'Fitted Curve');
    xlabel('\omega / \omega_0');
    ylabel('Amplitude');
    legend;
    title('Best Fit for Driven Damped Oscillator');
    grid on;

    % Display results
    fitted_mu = fitResult.mu;
    fitted_beta = fitResult.beta;

    disp(['Fitted mu = ', num2str(fitted_mu)]);
    disp(['Fitted beta = ', num2str(fitted_beta)]);
    disp(['Goodness-of-fit (R²) = ', num2str(gof.rsquare)]);
end
%}

function plot_theta(x1_data, A1_data, x2_data, A2_data)
    % Define the fit model based on the provided equation
    fitModel = fittype('mu ./ sqrt( (1 - x.^2).^2 + 4*beta^2*x.^2 )', ...
                    'independent', 'x', ...
                    'coefficients', {'mu', 'beta'});

    % Initial guesses for both datasets
    mu1_guess = max(A1_data);
    mu2_guess = max(A2_data);
    beta_guess = 0.1;

    % Fit for first dataset
    [fitResult1, gof1] = fit(x1_data, A1_data, fitModel, ...
                        'StartPoint', [mu1_guess, beta_guess]);
    % Fit for second dataset
    [fitResult2, gof2] = fit(x2_data, A2_data, fitModel, ...
                        'StartPoint', [mu2_guess, beta_guess]);

    % Generate fitted curves
    x1_fit = linspace(min(x1_data), max(x1_data), 1000);
    A1_fit = fitResult1.mu ./ sqrt( (1 - x1_fit.^2).^2 + 4*fitResult1.beta^2*x1_fit.^2 );
    x2_fit = linspace(min(x2_data), max(x2_data), 1000);
    A2_fit = fitResult2.mu ./ sqrt( (1 - x2_fit.^2).^2 + 4*fitResult2.beta^2*x2_fit.^2 );

    x_axis = 'Ratio between Angular Frequency and Natural Angular Frequency \it{\omega/\omega_0}';
    y_axis = 'Amplitude of Steady State Oscillations \it{\theta}_{\rm{st}} / \circ';
    title_txt = '\it{\theta_{st}} \rm{vs} \it{\omega/\omega_0}';

    % Plot both datasets and their fits
    figure;
    plot(x1_data, A1_data, 'blackx'); hold on;
    plot(x1_fit, A1_fit, 'b-');
    plot(x2_data, A2_data, 'red+');
    plot(x2_fit, A2_fit, 'r-');
    legend_txt = {'\beta_1 scatter', '\beta_1 curve', '\beta_2 scatter', '\beta_2 curve'};
    xlabel(x_axis, 'FontName','Times New Roman', 'Interpreter', 'tex');
    ylabel(y_axis, 'FontName','Times New Roman', 'Interpreter','tex');
    title(title_txt, 'FontName','Times New Roman', 'Interpreter','tex');
    legend(legend_txt, 'Location', 'best', 'FontSize', 8);

    grid on;

    % Display results for both fits
    disp('--- Fit 1 Results ---');
    disp(['Fitted mu = ', num2str(fitResult1.mu)]);
    disp(['Fitted beta = ', num2str(fitResult1.beta)]);
    disp(['Goodness-of-fit (R²) = ', num2str(gof1.rsquare)]);
    disp('--- Fit 2 Results ---');
    disp(['Fitted mu = ', num2str(fitResult2.mu)]);
    disp(['Fitted beta = ', num2str(fitResult2.beta)]);
    disp(['Goodness-of-fit (R²) = ', num2str(gof2.rsquare)]);
end

% Call the updated function
plot_theta(omega1, theta1, omega2, theta2);

function plot_sigmoid(x1_data, y1_data, x2_data, y2_data)
    % Define the sigmoid model
    sigmoidModel = fittype('L ./ (1 + exp(-k*(x - x0))) + y0', ...
        'independent', 'x', 'coefficients', {'L', 'k', 'x0', 'y0'});

    % Initial guesses for both datasets
    L1_guess = max(y1_data) - min(y1_data);
    k1_guess = 10;
    x01_guess = mean(x1_data);
    y01_guess = min(y1_data);

    L2_guess = max(y2_data) - min(y2_data);
    k2_guess = 10;
    x02_guess = mean(x2_data);
    y02_guess = min(y2_data);

    % Fit the data for both datasets
    [fitResult1, gof1] = fit(x1_data, y1_data, sigmoidModel, ...
        'StartPoint', [L1_guess, k1_guess, x01_guess, y01_guess]);
    [fitResult2, gof2] = fit(x2_data, y2_data, sigmoidModel, ...
        'StartPoint', [L2_guess, k2_guess, x02_guess, y02_guess]);

    % Generate fitted curves
    x1_fit = linspace(min(x1_data), max(x1_data), 1000);
    y1_fit = fitResult1.L ./ (1 + exp(-fitResult1.k*(x1_fit - fitResult1.x0))) + fitResult1.y0;
    x2_fit = linspace(min(x2_data), max(x2_data), 1000);
    y2_fit = fitResult2.L ./ (1 + exp(-fitResult2.k*(x2_fit - fitResult2.x0))) + fitResult2.y0;
    
    x_axis = 'Ratio between Angular Frequency and Natural Angular Frequency \it{\omega/\omega_0}';
    y_axis = 'Phase Shift of Steady State Oscillations \it{\phi} / \circ';
    title_txt = '\it{\phi} \rm{vs} \it{\omega/\omega_0}';

    % Plot
    figure;
    plot(x1_data, y1_data, 'bx'); hold on;
    plot(x1_fit, y1_fit, 'b-');
    plot(x2_data, y2_data, 'r+');
    plot(x2_fit, y2_fit, 'r-');
    legend_txt = {'\beta_1 scatter', '\beta_1 curve', '\beta_2 scatter', '\beta_2 curve'};
    xlabel(x_axis, 'FontName','Times New Roman', 'Interpreter', 'tex');
    ylabel(y_axis, 'FontName','Times New Roman', 'Interpreter','tex');
    title(title_txt, 'FontName','Times New Roman', 'Interpreter','tex');
    legend(legend_txt, 'Location', 'best', 'FontSize', 8);
    grid on;

    % Display fit results
    disp('--- Sigmoid Fit 1 Results ---');
    disp(fitResult1);
    disp(['Goodness-of-fit (R²) = ', num2str(gof1.rsquare)]);
    disp('--- Sigmoid Fit 2 Results ---');
    disp(fitResult2);
    disp(['Goodness-of-fit (R²) = ', num2str(gof2.rsquare)]);
end

% Call the function for your data
plot_sigmoid(omega1, phi1, omega2, phi2);