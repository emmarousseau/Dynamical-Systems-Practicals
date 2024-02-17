% Session 1, Exercise set 5, Question 2, 4
% Emma Rousseau

% Question 2

m = 4;
n = 4;
v = rand(n,m)

for i=1:(m*n)
    if v(i)<0.2
        v(i) = 0;
    else
        v(i) = 1;
    end
end

% Question 4

% a. The number of random numbers it takes to add up to 20 (or more).

counter=0;
sum=0;
while sum<20
    sum = sum + rand();
    counter = counter + 1;
end

counter;


% b. The number of random numbers it takes before a number between 0.8 and 0.85 occurs.

counter=0;
i=true;
while i
    j = rand();
    counter = counter + 1;
    if j>0.8 && j<0.85
        i=false;
    end
end

counter;

counter;