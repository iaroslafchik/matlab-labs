% =========================================================
% ЛР10 — графический метод ЛП
% =========================================================

clear;
clc;
close all;

%% Сетка

[x1,x2] = meshgrid(0:0.1:12, 0:0.1:8);

%% Ограничения

c1 = (x1 + 6*x2 >= 3);
c2 = (x1 - 6*x2 <= 3);
c3 = (3*x1 + 10*x2 <= 30);
c4 = (x2 <= x1/3 + 3);

feasible = c1 & c2 & c3 & c4;

%% Целевая функция

F = 3*x1 + x2;

%% Минимум

F(~feasible) = NaN;

[minF, idx] = min(F(:));
[i,j] = ind2sub(size(F), idx);

xmin = x1(i,j);
ymin = x2(i,j);

%% =========================================================
% График
% =========================================================

figure('Visible','off','Name','ЛР10','NumberTitle','off');

contourf(x1,x2,feasible,[1 1]);
colormap([1 1 1; 0.7 0.9 0.7]);
hold on;

contour(x1,x2,F,20);

plot(xmin,ymin,'ro','MarkerSize',10,'LineWidth',2);

title('ЛР10 — область допустимых решений и минимум');
xlabel('x1');
ylabel('x2');

%% =========================================================
% Сохранение
% =========================================================

exportgraphics(gcf,'lab10_lp.png','Resolution',300);
close(gcf);

fileID = fopen('lab10_lp.txt','w');

fprintf(fileID,'ЛР10 - ЛП графический метод\n\n');
fprintf(fileID,'xmin = %.4f\n', xmin);
fprintf(fileID,'ymin = %.4f\n', ymin);
fprintf(fileID,'Fmin = %.4f\n', minF);

fclose(fileID);

disp('Готово: lab10_lp.png и lab10_lp.txt');
