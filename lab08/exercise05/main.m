% =========================================================
% ЛР8 — Градиентный спуск
% f(x)=x^2+6x-8
% =========================================================

clear;
clc;
close all;

%% Функция и градиент

f  = @(x) x.^2 + 6*x - 8;
df = @(x) 2*x + 6;

%% Параметры

x = 10;          % начальная точка
alpha = 0.1;     % шаг обучения
eps = 0.001;

max_iter = 1000;

%% =========================================================
% Итерации
% =========================================================

iter = 0;

while abs(df(x)) > eps && iter < max_iter

    x = x - alpha * df(x);

    iter = iter + 1;

end

xmin = x;
ymin = f(xmin);

%% =========================================================
% График
% =========================================================

x_plot = linspace(-10,10,500);

figure('Visible','off','Name','Градиентный спуск','NumberTitle','off');

plot(x_plot, f(x_plot),'LineWidth',1.5);
grid on;
hold on;

plot(xmin, ymin, 'ro');

title('Метод градиентного спуска');
xlabel('x');
ylabel('f(x)');

%% =========================================================
% Сохранение
% =========================================================

exportgraphics(gcf,'lab8_gradient.png','Resolution',300);
close(gcf);

fileID = fopen('lab8_gradient.txt','w');

fprintf(fileID,'ЛР8 - Градиентный спуск\n\n');
fprintf(fileID,'xmin = %.6f\n', xmin);
fprintf(fileID,'f(xmin) = %.6f\n', ymin);
fprintf(fileID,'итераций = %d\n', iter);
fprintf(fileID,'alpha = %.4f\n', alpha);

fclose(fileID);

disp('Готово: lab8_gradient.png и lab8_gradient.txt');
