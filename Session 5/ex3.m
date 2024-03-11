% 1. Load the file cloud.mat. This file contains a matrix X with N = 500
% datapoints in R3.

close all

x = load('cloud');

% 2. Make a scatter plot of the 500 data points, represented as black dots
% in 3D space (Hint: use the command plot3, and check its help file to
% understand how to use it. It may also help to check the ’LineSpec’
% option in the help file of the command plot to see how you can plot
% individual points without connecting lines.).

figure;
plot3(x.X(1,:),x.X(2,:),x.X(3,:),'k.')


% 3. On the same plot, indicate the mean of the data with an asterisk (*)
% in red.

mean_x = mean(x.X,2);
hold on
plot3(mean_x(1),mean_x(2),mean_x(3),'r*')

% 4. Make a new matrix B, which is in mean-deviation form (this means
% that you subtract the mean from each data point).

B = x.X - mean_x;

% 5. Create a new figure, with the same scatter plot as before, but now
% using the data points in the mean-deviation form. This means that
% the cloud of data should be centered around the origin.

figure;
plot3(B(1,:),B(2,:),B(3,:),'k.')


% 6. Compute the 3 principal components of the data.

[U,S,V] = svd(B);

% 7. Perform a change of variables by projecting the 3D data on the three
% principal components, yielding three new variables y1, y2, y3.

y = U'*B;

% 8. Compute the variance of y1, y2, and y3 (use the command var).

var_y = var(y,0,2);

% 9. Compute the three eigenvalues of the sample covariance matrix S de-
% fined in Section 7.5 in Lay (S = 1/(N −1)BBT ), and compare with the
% values you obtained in the previous step. Explain what you observe.
% Hint: note that the principal components define the matrix P in an
% orthogonal diagonalization of S. Consider the variable y= P T xand
% its sample covariance matrix 1/(N−1)(P T B)(BT P ) = P T SP . Use the
% fact that the diagonal elements of a (sample) covariance matrix contain
% the variances of the individual entries of a multi-variate stochastic
% variable.

S = 1/(500-1)*(B*B');
[V_S,D_S] = eig(S);

% 10. Plot three lines through the origin in the direction of the three principal
% components (both the positive and negative parts). The length of
% each line should be equal to (2 times) the variance of the data in that
% particular direction. Use red for the first, blue for the second, and
% green for the third (you can again use the command plot3 here, but
% connect each point with a line).

figure;
plot3([0 2*sqrt(var_y(1))*U(1,1)],[0 2*sqrt(var_y(1))*U(2,1)],[0 2*sqrt(var_y(1))*U(3,1)],'r')
hold on
plot3([0 2*sqrt(var_y(2))*U(1,2)],[0 2*sqrt(var_y(2))*U(2,2)],[0 2*sqrt(var_y(2))*U(3,2)],'b')
plot3([0 2*sqrt(var_y(3))*U(1,3)],[0 2*sqrt(var_y(3))*U(2,3)],[0 2*sqrt(var_y(3))*U(3,3)],'g')

% 11. Make sure all axes of your plot cover an equal range (e.g., from -4 to
% 4). Hint: use the command axis.

axis([-4 4 -4 4 -4 4])

% 12. After plotting, add the following commands:
% •axis square (makes sure that the axes have the same scale)
% •grid on (adds grid lines)

axis square
grid on

% 13. Check by visual inspection: The three lines should be orthogonal
% (why?). The red line should point in the direction with highest vari-
% ance (why?). The green line should point in the direction with least
% variance (why?).

    % Red: first principal component, blue: second principal component, green:
    % third principal component. The lines are orthogonal because the
    % principal components are orthogonal. The red line points in the direction
    % with the highest variance because the first principal component is the
    % direction in which the data varies the most. The green line points in the
    % direction with the least variance because the third principal component
    % is the direction in which the data varies the least.
