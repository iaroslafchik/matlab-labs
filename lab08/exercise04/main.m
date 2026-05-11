% =========================================================
% ЛР8 — Метод параболической аппроксимации
% f(x)=x^2+6x-8
% =========================================================

clear;
clc;
close all;

%% Функция

f = @(x) x.^2 + 6*x - 8;

%% Начальные точки (должны окружать минимум)

x1 = -10;
x2 = -2;
x3 = 0;

eps = 0.001;

%% =========================================================
% Итерационный процесс
% =========================================================

while true

    f1 = f(x1);
    f2 = f(x2);
    f3 = f(x3);

    % коэффициенты параболы через три точки
    numerator = ( (x2-x1)^2*(f2-f3) - (x2-x3)^2*(f2-f1) );
    denominator = ( (x2-x1)*(f2-f3) - (x2-x3)*(f2-f1) );

    if denominator == 0
        break;
    end

    x_new = x2 - 0.5 * numerator / denominator;

    if abs(x_new - x2) < eps
        break;
    end

    % обновление точек
    if x_new < x2
        x3 = x2;
        x2 = x_new;
    else
        x1 = x2;
        x2 = x_new;
    end

end

xmin = x2;
ymin = f(xmin);

%% =========================================================
% График
% =========================================================

x = linspace(-10,10,500);

figure('Visible','off','Name','Параболическая аппроксимация','NumberTitle','off');

plot(x, f(x),'LineWidth',1.5);
grid on;
hold on;

plot(xmin, ymin, 'ro');

title('Метод параболической аппроксимации');
xlabel('x');
ylabel('f(x)');

%% =========================================================
% Сохранение
% =========================================================

exportgraphics(gcf,'lab8_parabolic.png','Resolution',300);
close(gcf);

fileID = fopen('lab8_parabolic.txt','w');

fprintf(fileID,'ЛР8 - Параболическая аппроксимация\n\n');
fprintf(fileID,'xmin = %.6f\n', xmin);
fprintf(fileID,'f(xmin) = %.6f\n', ymin);
fprintf(fileID,'eps = %.4f\n', eps);

fclose(fileID);

disp('Готово: lab8_parabolic.png и lab8_parabolic.txt');
