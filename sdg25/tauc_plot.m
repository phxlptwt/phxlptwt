% this is tauc-plot.m

clc, clearvars;

function scatter_plot(x, y, element, check)
    % PLOT FUNCTION
    figure;
    scatter(x, y, 'rx');
    x_label = 'Energy';
    if y == check
        y_label = 'Direct Band Gap';
    else
        y_label = 'Indirect Band Gap';
    end
    xlabel(x_label);
    ylabel(y_label);
    title(['Scatter Plot of ', y_label, ' vs ', x_label, ' for ', element]);
    grid on;
    legend([y_label ' vs ' x_label], 'Location', 'best');
end

function colData = get_column(sheetname, columnName)

    % READ COLUMN FROM EXCEL SHEET AND FORMAT TO ARRAY
    tbl = readtable("sdg_tauc_plots.xlsx", 'Sheet', sheetname);
    colData = table2array(tbl(:, columnName));
    if iscell(colData)
        colData = str2double(colData);
    end
end

s = input('', 's');

wavelength = get_column(s, "Column1");
absorbance = get_column(s, "Column2");

reflectance = 10 .^ (absorbance .* -1);

energy = 1239.85 ./ wavelength;
kubelka = (1-reflectance) .^2 ./ (2 .* reflectance); % Kubelka-Munk function
direct = (energy .* kubelka) .^ 2; % Direct band gap
indirect = sqrt(energy .* kubelka); % Indirect band gap
scatter_plot(energy, direct, s, direct);


