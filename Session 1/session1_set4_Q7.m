% Session 1, Exercise set 4, Question 7
% Emma Rousseau
% 

y = input('Enter y value: ');

answer = q7(y);

function [t] = q7(y)
    if y<10000
        t = 200;
    elseif y<20000
        t = 200 + 0.1 * (y - 10000);
    elseif y<50000
        t = 1200 + 0.15 * (y - 20000); 
    else
        t = 5700 + 0.25 * (y - 50000);
    end
end


% Test cases: a. y = 5,000 t = 200
% b. y = 17000 t = 900
% b. y = 25000 t = 1950
% c. y = 75000 t = 11950


%{
if y < 10000
 t = 200
 elseif 10000 < y < 20000
 t = 200 + 0.1*(y - 10000)
 elseif 20000 < y < 50000
 t = 1200 + 0.15*(y - 20000)
 elseif y > 50000
 t = 5700 + 0.25*(y - 50000)
 end

-> This given solution would not be correct because it does not handle
the following cases:
y = 10000 or 20000 or 50000

%}
