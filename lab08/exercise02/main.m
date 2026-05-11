% =========================================================
% ЛР8 — Метод Фибоначчи
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
% Числа Фибоначчи
% =========================================================

F = [1 1];

while F(end) < (b - a)/eps
    F(end+1) = F(end) + F(end-1);
end

n = length(F);

%% =========================================================
% Метод Фибоначчи
% =========================================================

k = 1;

x1 = a + F(n-2)/F(n)*(b-a);
x2 = a + F(n-1)/F(n)*(b-a);

f1 = f(x1);
f2 = f(x2);

for k = 1:n-3

    if f1 > f2
        a = x1;
        x1 = x2;
        f1 = f2;

        x2 = a + F(n-k-1)/F(n-k)*(b-a);
        f2 = f(x2);
    else
        b = x2;
        x2 = x1;
        f2 = f1;

        x1 = a + F(n-k-2)/F(n-k)*(b-a);
        f1 = f(x1);
    end
end

xmin = (a + b)/2;
ymin = f(xmin);

%% =========================================================
% График
% =========================================================

x = linspace(-10,10,500);

figure('Visible','off','Name','ЛР8 Фибоначчи','NumberTitle','off');

plot(x, f(x),'LineWidth',1.5);
grid on;
hold on;

plot(xmin, ymin, 'ro');

title('Метод Фибоначчи');
xlabel('x');
ylabel('f(x)');

%% =========================================================
% Сохранение
% =========================================================

exportgraphics(gcf,'lab8_fibonacci.png','Resolution',300);
close(gcf);

fileID = fopen('lab8_fibonacci.txt','w');

fprintf(fileID,'ЛР8 - Метод Фибоначчи\n\n');
fprintf(fileID,'xmin = %.6f\n', xmin);
fprintf(fileID,'f(xmin) = %.6f\n', ymin);
fprintf(fileID,'eps = %.4f\n', eps);

fclose(fileID);

disp('Готово: lab8_fibonacci.png и lab8_fibonacci.txt');
