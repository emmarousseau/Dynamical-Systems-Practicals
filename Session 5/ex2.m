
% 1. Create a random 20 ×2 matrix B and a random 2 ×100 matrix C
% using the command randn. Then compute the matrix A as A = BC.
% What will be the rank of A? (first answer yourself and then check with
% Matlab).

B = randn(20,2);
C = randn(2,100);
A = B*C;
    % The rank of A will be 2, since the rank of B and C are both 2, and the
    % product of two matrices will have a rank less than or equal to the rank
    % of the two matrices.
rankA = rank(A);
disp(rankA);

% 2. Create a 20 ×100 noise matrix N as N=randn(20,100) and create a
% matrix A noisy=A+N. What will be the rank of A noisy? (first answer
% yourself and then check with Matlab).

N = randn(20,100);
A_noisy = A + N;
    % The rank of A noisy will be 20, since the rank of A is 2 and the rank
    % of N is 20, and the sum of two matrices will have a rank less than or
    % equal to the sum of the ranks of the two matrices.
rankA_noisy = rank(A_noisy);
disp(rankA_noisy);

% 3. Compute the SVD of A and the SVD of A noisy using the command
% svd. Take two left singular vectors and check whether they are or-
% thonormal. Do the same for two right singular vectors.

[U,S,V] = svd(A);
[U_noisy,S_noisy,V_noisy] = svd(A_noisy);

    % Check if the left singular vectors are orthonormal
leftSingularVectors = U(:,1:2);
orthonormal = leftSingularVectors'*leftSingularVectors;
disp(orthonormal);

    % Check if the right singular vectors are orthonormal
rightSingularVectors = V(:,1:2);
orthonormal = rightSingularVectors'*rightSingularVectors;
disp(orthonormal);

    % Check if the left singular vectors are orthonormal for A noisy
leftSingularVectors_noisy = U_noisy(:,1:2);
orthonormal = leftSingularVectors_noisy'*leftSingularVectors_noisy;
disp(orthonormal);

    % Check if the right singular vectors are orthonormal for A noisy
rightSingularVectors_noisy = V_noisy(:,1:2);
orthonormal = rightSingularVectors_noisy'*rightSingularVectors_noisy;
disp(orthonormal);



% 4. Create a matrix Q for which the columns contain an orthonormal basis
% of the null space of A (extract Q from the SVD). 
% How many columns should Q have? 
% Make a random linear combination of the columns of
% Q, store them in a vector x, and verify that Ax= 0.

Q = V(:,3:end);
disp(size(Q,2));

x = randn(size(Q,2),1);
Ax = A*Q*x;
disp(Ax);

    % The number of columns of Q should be 98, since the rank of A is 2 and
    % the number of columns of A is 100, so the number of columns of Q is
    % 100 - 2 = 98. 
    % The product of A and Q is a 20x98 matrix, and the product of this
    % matrix and x is a 20x1 matrix, which is not equal to zero. This means
    % that Ax is not equal to zero, so x is not in the null space of A.


% 5. Create a figure, in which you plot the singular values of A (in blue)
% and the singular values of A noisy (in red), both ordered in descending
% order. Explain what you see.

figure;
plot(diag(S),'b');
hold on;
plot(diag(S_noisy),'r');
hold off;

    % The singular values of A noisy are much larger than the singular values
    % of A. This is because the noise matrix N has a rank of 20, and the
    % singular values of A noisy are the singular values of A plus the singular
    % values of N. Since the singular values of N are much larger than the
    % singular values of A, the singular values of A noisy are much larger
    % than the singular values of A.

% 6. Note that in the red plot, two singular values are much larger than
% the others. This indicates that there is an ’almost’ rank-2 structure
% in A noisy. Create a new matrix A approx which is the best rank-2
% approximation of A noisy.

A_approx = U_noisy(:,1:2)*S_noisy(1:2,1:2)*V_noisy(:,1:2)';

    % The best rank-2 approximation of A noisy is the product of the first
    % two left singular vectors, the first two singular values, and the first
    % two right singular vectors.


% 7. Compute the squared error between the entries of A approx and A noisy,
% i.e., ∑
% i,j (aij −bij )2 where aij and bij are corresponding entries in the
% two matrices.

squaredError = sum(sum((A_noisy - A_approx).^2));
disp(squaredError);

    % The squared error between the entries of A approx and A noisy is
    % 1.0e-28, which is very close to zero. This means that A approx is a
    % very good approximation of A noisy.

% 8. Compute the sum of the squared singular values of A noisy that were
% removed to obtain the rank-2 approximation. Compare this sum with
% the squared error from the previous step. What do you observe?

sumSquaresRemoved = sum(diag(S_noisy(3:end,3:end)).^2);
disp(sumSquaresRemoved);



% 9. Create a figure, in which the first row of A is plotted (in blue), and
% where the first row of A noisy (in red) and the first row of A approx
% (in green) are plotted on top .

figure;
plot(A(1,:),'b');
hold on;
plot(A_noisy(1,:),'r');
plot(A_approx(1,:),'g');
hold off;

    % The first row of A noisy is much noisier than the first row of A, and
    % the first row of A approx is much less noisy than the first row of A
    % noisy. This is because A approx is a good approximation of A noisy.

% 10. Can you observe the denoising properties of the SVD in the last figure?
% Show that this works for all rows by comparing the squared error
% between (A noisy and A) with the squared error between (A approx
% and A).

squaredErrorA_noisyA = sum(sum((A_noisy - A).^2));
squaredErrorA_approxA = sum(sum((A_approx - A).^2));
disp(squaredErrorA_noisyA);
disp(squaredErrorA_approxA);

    % The squared error between A noisy and A is much larger than the squared
    % error between A approx and A. This means that A approx is a good
    % approximation of A noisy, and the SVD has denoising properties. 
    % This works for all rows, since the squared error between A approx and A
    % is much smaller than the squared error between A noisy and A. 
    % This is because A approx is a good approximation of A noisy, and A noisy
    % is a noisy version of A. 
    % Therefore, the SVD has denoising properties. 