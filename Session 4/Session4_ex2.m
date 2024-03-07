
% load data from spectraldata.mat
load spectraldata

% 1-2: plot component 1 in blue and component 2 in red
figure;
plot(component1, 'b')
hold on
plot(component2, 'r');
plot(mixture1, 'g');


% 3: linear combination of the components

% create a matrix A with the components as columns
A = [component1, component2];

% create a column vector b with the mixture
b = mixture1;

% solve the SOLE using row reduction
x = rref([A, b]);

% print the results
fprintf('The amount of component 1 in mixture1 is %f\n', x(1,3));
fprintf('The amount of component 2 in mixture1 is %f\n', x(2,3));

% 4: plot the mixture and the linear combination of the components
figure;
plot(mixture1, 'b');
hold on
plot(x(1,3)*component1 + x(2,3)*component2, 'r');
legend('Mixture 1', 'Linear Combination of Components');

% 5: plot mixture 2
figure;
plot(mixture2, 'b');

% 6: Use least-squares to (approximately) quantify the amount of component1 and component2
% in mixture2. From the result, can you see whether mixture1 and
% mixture2 have a similar chemical content?

% create a column vector b with the mixture
b = mixture2;

% solve the SOLE using least-squares
x = A\b;

% print the results
fprintf('The amount of component 1 in mixture2 is %f\n', x(1));
fprintf('The amount of component 2 in mixture2 is %f\n', x(2));

% 7: plot the mixture and the linear combination of the components
figure;
plot(mixture2, 'b');
hold on
plot(x(1)*component1 + x(2)*component2, 'r');
legend('Mixture 2', 'Linear Combination of Components');

%{
    Result:
    The amount of component 1 in mixture1 is 1.000000
    The amount of component 2 in mixture1 is 5.000000
    The amount of component 1 in mixture2 is 1.182534
    The amount of component 2 in mixture2 is 5.068689  
    
    Very similar composition.
%}

% 8: Repeat number 6 and 7 for mixture 3
% create a column vector b with the mixture
A = [component1, component2];
b = mixture3;

% solve the SOLE using row reduction 
% *** does not work, likely because the system is not consistent/undetermined
x = rref([A, b]);

% print the results
fprintf('The amount of component 1 in mixture3 is %f\n', x(1,3));
fprintf('The amount of component 2 in mixture3 is %f\n', x(2,3));

figure;
plot(mixture3, 'g');
hold on
plot(x(1,3)*component1 + x(2,3)*component2, 'r');
legend('Mixture 3', 'Linear Combination of Components');


% solve the SOLE using least-squares
x = A\b;

% print the results
fprintf('The amount of component 1 in mixture3 is %f\n', x(1));
fprintf('The amount of component 2 in mixture3 is %f\n', x(2));

% 9: plot the mixture and the linear combination of the components
figure;
plot(mixture3, 'b');
hold on
plot(x(1)*component1 + x(2)*component2, 'r');
legend('Mixture 3', 'Linear Combination of Components');


