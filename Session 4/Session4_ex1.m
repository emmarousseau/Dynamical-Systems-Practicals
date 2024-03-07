
% Session 4 exercise 1
% Emma Rousseau

x = 0:7;
y = [6 4 3 5 3 4 -1 2 ];

% a) plot the data
figure(1)
plot(x,y,'o')

% b) fit a function of the form c1 + c2*sin(x) + c3*cos(x)
% to the data using the least squares method
A = [ones(8,1) sin(x') cos(x')];
b = y';
c = A\b;

% c) plot the data and the fitted function
figure(2)
xx = 0:0.1:7;
yy = c(1) + c(2)*sin(xx) + c(3)*cos(xx);
plot(x,y,'o',xx,yy)

% using the same data points, fit a function of the form c1 + c2*sin(x) + c3*cos(x) + c4*sin(2x) + c5*cos(2x)
% to the data using the least squares method
A = [ones(8,1) sin(x') cos(x') sin(2*x') cos(2*x')];
c = A\b;

% d) plot the data and the fitted function
figure(3)
yy = c(1) + c(2)*sin(xx) + c(3)*cos(xx) + c(4)*sin(2*xx) + c(5)*cos(2*xx);
plot(x,y,'o',xx,yy)


% Straight-line fitting
x = [ -2 -5 0 5 1 ];
y = [0 -1 0 2 0 ];

A = [x' ones(5,1)];
c = A\y';

% e) plot the data and the fitted function
figure(4)
yy = c(1)*xx + c(2);
plot(x,y,'o',xx,yy)

