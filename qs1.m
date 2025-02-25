% Define the piecewise signal y(t) 
function y = signal_y(t)
    y = zeros(size(t)); % Initialize y as a zero vector
    
    % Apply piecewise definition
    y(t <= -5) = t(t <= -5) + 5;
    y(t > -5 & t <= -2) = 11 + 4*t(t > -5 & t <= -2);
    y(t > -2 & t <= 1) = 24 - 9*t(t > -2 & t <= 1);
    y(t > 1 & t <= 3) = t(t > 1 & t <= 3) - 6;
    y(t > 3 & t <= 6) = t(t > 3 & t <= 6) - 6;
end

% Time vector
t = -6:0.01:6;

% Plot original signal y(t)
% figure(1);
subplot(2,1,1);
plot(t, signal_y(t));
xlabel('Time (s)');
ylabel('y(t)');
title('Plot of y(t)');

% Plot transformed signal y(3-2t)
% figure(2);
subplot(2,1,2);
plot(t, signal_y(3-2*t));
xlabel('Time (s)');
ylabel('y(3-2t)');
title('Plot of y(3-2t)');