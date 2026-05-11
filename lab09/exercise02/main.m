% =========================================================
% ЛР9 — Задание 2
% Аналитический экстремум функции 2 переменных
% =========================================================

clear;
clc;
close all;

%% Функция

f = @(x1,x2) sqrt(x1.^2 + x2.^2 + 1) + 0.5*x1 - 0.5*x2;

%% Сетка

[x1,x2] = meshgrid(linspace(-2,2,200));

F = f(x1,x2);

%% Точка минимума

x1_min = -sqrt(2)/2;
x2_min =  sqrt(2)/2;
f_min  = f(x1_min,x2_min);

%% =========================================================
% График поверхности
% =========================================================

figure('Visible','off','Name','ЛР9 2D','NumberTitle','off');

surf(x1,x2,F);
shading interp;
hold on;

plot3(x1_min,x2_min,f_min,'ro','MarkerSize',10,'LineWidth',2);

title('Экстремум функции двух переменных');
xlabel('x1');
ylabel('x2');
zlabel('f(x1,x2)');

%% =========================================================
% Сохранение
% =========================================================

exportgraphics(gcf,'lab9_multivar.png','Resolution',300);
close(gcf);

fileID = fopen('lab9_multivar.txt','w');

fprintf(fileID,'ЛР9 - Задание 2\n\n');
fprintf(fileID,'xmin = (%.6f, %.6f)\n', x1_min, x2_min);
fprintf(fileID,'fmin = %.6f\n', f_min);

fclose(fileID);

disp('Готово: lab9_multivar.png и lab9_multivar.txt');
