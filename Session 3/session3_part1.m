
% Session 3 part 1 - linear algebra
% Emma Rousseau

% Question 1

a = [2 3; 1 4];
p1 = poly(a)

b = [1 2 -2; -2 5 -2; -6 6 -3];
p2 = poly(b)

c = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];
p3 = poly(c)

% Question 2
roots(p1)
roots(p2)
roots(p3)

% Question 3
eig(a)
eig(b)
eig(c)

% Question 4
a = [-2 2 -3;
      2 1 -6;
    -1 -2 0];

eig(a)
eig(a')
eig(inv(a))

% Question 5
a = [4 -5; 2 -3];
[p, d] = eig(a);
p/a*p == d
inv(p)*a*p == d

% Question 6
a = [1 2; 0 1];
[p, d] = eig(a);
p/a*p == d % not diagonalizable

% Question 7
a = [2 3; 1 4];
[p, d] = eig(a);
p/a*p == d

[p, d] = eig(b);
p/b*p == d

[p, d] = eig(c);
p/c*p == d

% Question 8
i = [1 2 3 4 5 6 7 8 9 10];
j = i;
eigens = zeros(100, 1);

for t = 0:0.1:10
    a = zeros(10, 10);
    for i = 1:10
        for j = 1:10
            a(i, j) = 1/(i+j+t);
        end
    end
    [p, d] = eig(a);
    eigens(round(t*10 + 1)) = max(diag(d));
end

t = 0:0.1:10;
plot(t, eigens)