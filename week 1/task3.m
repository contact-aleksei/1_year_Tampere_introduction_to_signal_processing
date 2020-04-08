dfunc = @(x)cos(x);
x = 0:0.01:2*pi;
plot (x, func(x)); grid on;
title(' Plot the cosine function on the interval [0, 2pi].')