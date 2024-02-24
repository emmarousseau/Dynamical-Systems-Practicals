
% Graphics exercises Session 2

close all

x = -4:0.1:4;
y = sin(x);
c = cos(x);

hold on
plot(x, y, "blue")
plot(x, c, "red")

figure
hold on
plot(x, exp(-2*(x+1)), "bo:")
plot(x, exp(-2*x), "m*:")
plot(x, exp(-2*(x-1)), "g^:")
legend

figure
hold on
plot(x, exp(-2*(x+1)), "bo")
plot(x, exp(-2*x), "m*")
plot(x, exp(-2*(x-1)), "g^")
legend


figure
hold on
t = 0:0.001:2;
x = cos(t*3);
y = sin(2*t);
plot(x, y)
title("Cool parametric curve")
xlabel("x")
ylabel("y")


figure
hold on
x = randn(100,1);
y = 3.*randn(100,1);
plot(x, y, "b.")
xlim([-10 10])
ylim([-12 12])


figure
hold on
t = 0.1:0.1:4;
x = 3.*cos(t);
y = sin(t);
z = 1./t;

plot3(x, y, z)


figure
hold on
[x, y] = meshgrid(-2:0.1:2, -2:0.1:2);
z = exp(-2*x) .* exp(-2*y);
mesh(x, y, z);

figure
surf(x, y, z);
% now you can actually see the surface and move it around in 3d.
