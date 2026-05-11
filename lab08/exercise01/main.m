% =========================================================
% ЛР8 — Метод дихотомии (поиск минимума)
% f(x)=x^2+6x-8
% =========================================================

clear;
clc;
close all;

%% Функция

f = @(x) x.^2 + 6*x - 8;

%% Интервал

a = -10;
b = 10;

eps = 0.001;

%% =========================================================
% Метод дихотомии
% =========================================================

while (b - a) > eps
    c = (a + b)/2;
    delta = eps/10;

    x1 = c - delta;
    x2 = c + delta;

    if f(x1) < f(x2)
        b = c;
    else
        a = c;
    end
end

xmin = (a + b)/2;
ymin = f(xmin);

%% =========================================================
% График
% =========================================================

x = linspace(-10,10,500);

figure('Visible','off','Name','ЛР8','NumberTitle','off');

plot(x, f(x),'LineWidth',1.5);
grid on;
hold on;

plot(xmin, ymin, 'ro');

title('Метод дихотомии: минимум функции');
xlabel('x');
ylabel('f(x)');

%% =========================================================
% Сохранение
% =========================================================

exportgraphics(gcf,'lab8_result.png','Resolution',300);
close(gcf);

fileID = fopen('lab8_result.txt','w');

fprintf(fileID,'ЛР8 - Метод дихотомии\n\n');
fprintf(fileID,'xmin = %.6f\n', xmin);
fprintf(fileID,'f(xmin) = %.6f\n', ymin);
fprintf(fileID,'eps = %.4f\n', eps);

fclose(fileID);

disp('Готово: lab8_result.png и lab8_result.txt');
