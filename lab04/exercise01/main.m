% =========================================================
% ЛР4 — Задание 1
% Численное преобразование Лапласа
% f(t) = u(t) * exp(-2Nt)
% =========================================================

clear;
clc;

%% Параметры

N = 2;                 % можно менять
s = linspace(0, 20, 500);

t_max = 10;            % предел интегрирования (аппроксимация ∞)
t = linspace(0, t_max, 5000);
dt = t(2) - t(1);

%% Функция

f = exp(-2*N*t);

%% Численное преобразование Лапласа

F = zeros(size(s));

for k = 1:length(s)
    integrand = exp(-s(k)*t) .* f;
    F(k) = sum(integrand) * dt;
end

%% Теоретическое выражение (для сравнения)

F_theory = 1 ./ (s + 2*N);

%% =========================================================
% Графики
% =========================================================

figure('Visible','off','Name','Лаплас','NumberTitle','off');

plot(s, F, 'b', 'LineWidth', 1.5);
hold on;
plot(s, F_theory, 'r--', 'LineWidth', 1.5);
grid on;

title('Преобразование Лапласа');
xlabel('s');
ylabel('F(s)');
legend('Численное', 'Теоретическое');

%% Сохранение графика

exportgraphics(gcf, 'laplace_plot.png', 'Resolution', 300);
close(gcf);

%% Сохранение численного результата

fileID = fopen('laplace_result.txt','w');

fprintf(fileID, 'ЛР4 - Задание 1\n');
fprintf(fileID, 'f(t) = exp(-2*N*t)\n');
fprintf(fileID, 'N = %d\n\n', N);

fprintf(fileID, 's\tF_num\tF_theory\n');

for k = 1:length(s)
    fprintf(fileID, '%.4f\t%.6f\t%.6f\n', s(k), F(k), F_theory(k));
end

fclose(fileID);

disp('Готово: laplace_plot.png и laplace_result.txt');

drawnow;
exit;
