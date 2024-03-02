
% Session 3 part 2
% Emma Rousseau

% load the file Adj_matrix.mat
load('Adj_matrix.mat');

imagesc(A);

% Compute the PageRank of each webpage and store them in the variable PR (a useful
% command can be diag)

%% PCA approach

s=size(A)
for i = [1:s(1)]
    A(:,i)=A(:,i)/sum(A(:,i));
end

[P,D] = eig(A);
eigvals = diag(D);
[max_,arg] = max(eigvals);
PR = P(:,arg);
PR = PR/sum(PR);

load('solution.mat');
[PR_sol PR]
prod(round(PR_sol*1000)==round(PR*1000))

figure(2)
clf;

hold on;
plot(PR_sol, "r")
plot(PR, "b")
legend;

% close all figures
close all

%{
    In a galaxy far far away, there is a planet with a population of 100 green-colored aliens and 100
blue-colored aliens who live in two different villages which are isolated by a river of lava. One
day, the lava river dries up, and the aliens from the two villages can “meet” each other, which
results in a baby boom. The next year, the alien government declares that the alien population
consists of 115 green-colored aliens and 110 blue-colored aliens. The year after, there are 133
green-colored aliens and 122 blue-colored aliens.
Dr. Gram and Dr. Schmidt, two alien-Nobel prize winners which are experts in linear algebra,
figured out that the following linear model describes the evolution of the alien population:
xi+1 = Axi
where A is a 2 ×2 matrix, and with
xi =
[gi;
 bi]
where gi and bi denote the number of green aliens and blue aliens in year i, respectively.
Question 1: Using MATLAB, compute the entries of the matrix A, assuming that the data
of the alien population given by the alien government indeed exactly follows the model of Dr.
Gram and Dr. Schmidt.
%}

% the alien population in year 1
x1 = [100; 100];
% the alien population in year 2
x2 = [115; 110];
% the alien population in year 3
x3 = [133; 122];

% the matrix A
A = [x2; x3]/[x1; x2];

%{
    Questions 2 and 3 of this part are in written format not included in this file.
%}
