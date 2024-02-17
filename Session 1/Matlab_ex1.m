% Session 1 Dynamical Systems
% Emma Rousseau


% Exercise Set 1

% Question 1
x=32:2:74;

% Question 2
% a
a=x+16;

% b ***
for i=1:length(x)
    if i%2==1,
      x(i)=x(i)+3;
    else
      x(i)=x(i);
    end
end

% c
c=sqrt(x);

% d
d=x.^2;


% Question 6 (see function at end of file)
v=double.empty(0,100);
for i=0:99
    v(i+1)=example(i);
end


% Question 8
% b
% b=exp(t).*(1+cos(3.*title));


% Question 9
x=0:0.01:4;
hold on
plot(x,x)
plot(x,x.^3)
plot(x,exp(x))
plot(x,exp(x.*2))
legend()

clf
hold on
semilogy(x,x)
semilogy(x,x.^3)
semilogy(x,exp(x))
semilogy(x,exp(x.*2))
legend()

clf
hold on
loglog(x,x)
loglog(x,x.^3)
loglog(x,exp(x))
loglog(x,exp(x.*2))
legend()

% Question 10
x=0.01:0.0001:0.1;
semilogx(x,sin(1./x))



% Exercise Set 2

% Question 1
x = [3 1 5 7 9 2 6];

% a: element at index 3 of the array
% b: elements from indexes 1 to 7 of the array
% c: elements from index 1 to the end of the array (so the whole array)
% ok the rest is easy too


% Question 2
A = [ 2 4 1 ; 6 7 2 ; 3 5 9];

% a
x1=A(1:2,1:end);

% b
y=A(2:end,1:end);

% c
s1=sum(A,1);

% d
s2=sum(A,2);

% e
sd=std(A,0,1);


% Question 3
x = [1 4 8];
y = [2 1 5];
A = [3 1 6 ; 5 2 7];

% will execute: a, b, f, g
% will not execute: c, d, e


% Question 4
A = [2 7 9 7 ; 3 1 5 6 ; 8 1 2 5];
% a: transposed matrix
% b: 1st and 4th column of the array
% c: 4x4 array from the subset
% d: reshape to2 rows and 6 columns
% e: all rows
% f: flipped along horizontal axis
% g: flipped along vertical axis
% h: doesn´t work
% i: rows 1 to 3
% j: adding first two rows to bottom of the matrix
% k: sum of all elements
% l: same
% m: sum along each rows
% k: sum along columns and rows and total (like a pivot table)


% Question 6
randn('seed',123456789); %#ok<RAND>
F = randn(5,10);

% a
avg=mean(F,1);

% b
s=std(F, 0, 1);


% Exercise Set 3

% Question 1
x = [1 5 2 8 9 0 1];
y = [5 2 2 6 0 0 2];

% a
x>y;

% b
y<x;

% c
x==y;

% d
x<=y;

% e
y>=x;


% Question 2

% a
x=1:10;
y=[3 1 5 6 8 2 9 4 7 0];

(x>3)&(x<8)

%b
x(x>5)


% Question 3
x = [3 15 9 12 -1 0 -12 9 6 1];

% a: command that sets the values of x that are positive to 0
x(x>0)=0

% b: command that sets the values of x that are multiples of 3 to 3 with the rem command
x(rem(x,3)==0)=3


% Exercise Set 4

% Question 1
% EVALUATE THE CODE ON PAPER AND THEN CHECK WITH MATLAB
m=0;
n=7;

if n > 1
  m = n+1
  else
  m = n - 1
end


% a. n = 7 m = ?
% b. n = 0 m = ?
% c. n = -10 m = ?

% Question 2
% EVALUATE THE CODE ON PAPER AND THEN CHECK WITH MATLAB
w=0;
z=1;

if z < 5
  w = 2*z
  elseif z < 10
    w = 9 - z
  elseif z < 100
    w = sqrt(z)
  else
    w = z
end

%  a. z = 1 w = ?
%  b. z = 9 w = ?
%  c. z = 60 w = ?
%  d. z = 200 w = ?


function [y] = example(n)
nom=(-1)^(n+1);
denom=(2*n)-1;
y=nom/denom;
end


