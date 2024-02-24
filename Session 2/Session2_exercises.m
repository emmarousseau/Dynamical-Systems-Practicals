% Session 2

% Question 1

a = [1 0 1; 
     2 4 0; 
     0 0 1];

l = [1 1 1; 
     2 0 4; 
     3 4 2];

for i = 1:3
    sum = 0;
    for j = 1:3
        if a(j,i) ~= 0
            sum = sum + 1/a(j,i);
        end
    end
    disp(['The sum of the inverted elements of column ', num2str(i), ' of a is ', num2str(sum)]);
end



% 2
% a: compute the inverse of a
a_inv = inv(a);

% b: Do the columns of A span R3 ? If yes: why? If not: what do they span?
rank(a)
% The columns of A span R3 because the determinant of A is not zero, so the columns are linearly independent.

% c: Try to compute the inverse of L. What happens?
l_inv = inv(l);
% We get a warning saying the matrix is close to being singular.
% We still get a result but it's not great. 


% d: Do the columns of L span R3? If yes: why? If not: what do they span?
rank(l)
% Rank is 2


% Question 3
% a: Confirm that invA is an inverse by creating the identity matrix I with I = A * invA.
I = a * a_inv;

% b: Confirm that A is the inverse of invA by computing Z as the inverse of invA and check whether Z==A.
Z = inv(a_inv);
Z == a;


% Question 4
inva2 = a_inv .* 4;
inva2 = inva2 + 2;
inva2(1,2) = inva2(1,2) + 5;
inva2(3,:) = inva2(3,:) + 7;

% Question 5
at = a';
% a
at^5;
% b
at.^5; % not that same!

% c
at(3,:) = at(3,:)-1;
at(2,:) = at(2,:)./4;
at(3,:) = at(3,:)+(at(2,:).*2);

% d
% not in echelon form yet, rows 2 and 3 and the same
at(3,:) = at(3,:)-at(2,:);


% e
% it was not
at(1,:) = at(1,:)-(2*at(2,:));


% Question 6
b = [1 1 1];
b = b';

% Question 7
% Ax = b
% A'Ax = A'b
% x = A'b ????
x = a'*b;

% ?????
rref(a) * b;


% Question 8


% Question 9
B = rand(3, 100);
% its consistent because the rref of a is the identity matrix to any
% linear combination is possible to get b

for i = 1:100
    x = rref(a)' * B(:,i);
end
    % gives no error :)

x = a'*B;


% Question 10
%{
 Create a random matrix C with 20 rows and 50 columns. Are the columns of C linearly
dependent? (you don't need Matlab to check this). If yes, find a linear dependence relation
between them
%}

c=rand(20,50);
% ????????????????????? SEE SOLUTION


% Question 11
x = [1 2 3];
xcube = x.^3;

% Question 12
diag(diag(a));

% Question 13
d = c(11:20, 11:15);
rank(d); % not linearly independant, rank = 5 (?)

% Question 14
e = rand(3,3);
f = rand(3,3);
e*f == f*e;
f = e';
e*f == f*e; % nope seems like that doesnt work either...

% Question 15
g = rand(4,4);
h = g';
gh = g*h;
hg = h*g;
gh==hg % not equal

y=gh;
yt=y';
y*yt == yt*y % equal
y==yt % also equal, they are symmetric matrices

% y is symmetric because it was defined as the product of a matrix and its
% transpose. The product of a matrix and its transpose is always symmetric.

% Question 16
a_sub = a(1:2, 1:2);
det(a_sub); % yes its invertible.

