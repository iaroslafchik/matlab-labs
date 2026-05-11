% =========================================================
% ЛР4 — Задание 2
% Обратное преобразование Лапласа (без Symbolic Toolbox)
% F(s) = 1/(s+a)^N
% =========================================================

clear;
clc;

%% Параметры

a = 2;
N = 4;

t = linspace(0, 5, 1000);

%% Обратное преобразование (аналитическая формула)

f = (t.^(N-1) ./ factorial(N-1)) .* exp(-a*t);

%% =========================================================
% График
% =========================================================

figure('Visible','off','Name','Обратное Лапласа','NumberTitle','off');

plot(t, f, 'LineWidth', 1.5);
grid on;

title('Обратное преобразование Лапласа');
xlabel('t');
ylabel('f(t)');

%% Сохранение графика

exportgraphics(gcf, 'laplace_inverse.png', 'Resolution', 300);
close(gcf);

%% Сохранение в файл

fileID = fopen('laplace_inverse_result.txt','w');

fprintf(fileID, 'ЛР4 - Задание 2\n');
fprintf(fileID, 'F(s) = 1/(s+a)^N\n\n');
fprintf(fileID, 'a = %d\nN = %d\n\n', a, N);
fprintf(fileID, 'f(t) = (t^(N-1)/(N-1)!) * exp(-a*t)\n\n');

for i = 1:length(t)
    fprintf(fileID, '%.5f\t%.6f\n', t(i), f(i));
end

fclose(fileID);

disp('Готово: laplace_inverse.png и laplace_inverse_result.txt');

drawnow;
exit;
