clc; clear; close all;

% Define discrete index range
n = 0:12;  % Adjusted for convolution range

% Define X(n) = 1 for 0<=n<=4
%             = 0 Otherwise
X = (n >= 0) - (n >= 5);

% Define h(n) = 2^n for 0<=n<=6
%             = 0 Otherwise
h = ((n >= 0) - (n >= 7)).*(2.^n);

% Find lengths of X and h
Lx = length(X);
Lh = length(h);
Ly = Lx + Lh - 1; % Length of convolution result

% Manual Convolution (Normal Method)
y_manual = zeros(1, Ly); % Initialize result
for i = 1:Lx
    for j = 1:Lh
        y_manual(i + j - 1) = y_manual(i + j - 1) + X(i) * h(j);
    end
end

% Convolution using MATLAB's built-in function
y_builtin = conv(X, h);

% Define time index for convolution result
n_conv = 0:(Ly - 1);

% Plot X(n)
 figure;
% subplot(4,1,1);
stem(n, X, 'b', 'LineWidth', 2);
grid on;
xlabel('n'); ylabel('X(n)');
title('Input Sequence X(n)');

% Plot h(n)
 figure;
% subplot(4,1,2);
stem(n, h, 'r', 'LineWidth', 2);
grid on;
xlabel('n'); ylabel('h(n)');
title('Impulse Response h(n)');

% Plot Convolution Result (Manual)
 figure;
% subplot(4,1,3);
stem(n_conv, y_manual, 'g', 'LineWidth', 2);
grid on;
xlabel('n'); ylabel('y(n)');
title('Convolution Result using Normal Method');

% Plot Convolution Result (Built-in)
 figure;
% subplot(4,1,4);
stem(n_conv, y_builtin, 'm', 'LineWidth', 2);
grid on;
xlabel('n'); ylabel('y(n)');
title('Convolution Result using MATLAB "conv" function');

% Display Results
disp('Manual Convolution Result:');
disp(y_manual);
disp('Built-in CONV Function Result:');
disp(y_builtin);

% Validate the result
if isequal(y_manual, y_builtin)
    disp('Validation Successful: Both results match!');
else
    disp('Validation Failed: Results do not match.');
end
