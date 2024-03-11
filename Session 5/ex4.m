% 1. Load the file spectraldata_noisy.mat. This file contains a matrix
% X with N = 2000 spectra of biological tissue samples in its columns,
% and we know from the experimental set-up that each spectrum con-
% tains a mixture of two bio-chemical components. Note that each spec-
% trum consists of 512 entries, i.e., we are analyzing data points in R512.

load('spectraldata_noisy');

% 2. Plot the first spectrum. Run the m-file at this point, and observe
% that the spectrum is very noisy. In fact, it is too noisy to accurately
% quantify the relative amount of each of the two components in the
% sample.

figure;
plot(X(:,1));
title('First spectrum');

% 3. Now let’s try to find some structure in the data using PCA. Apply
% PCA to the data1 in X, and generate a plot from which you can infer
% the number of principal components that are needed to explain most
% of the variance in the data (which plot should you make?). Run the
% m-file at this point, to find this number (you should ’see’ that the
% answer is 2).

[coeff,score,latent,tsquared,explained,mu] = pca(X');
figure;
plot(explained);
title('Explained variance');

% 4. Put the first two principal components in the columns of the matrix
% P = [u1 u2]. Plot both principal components on top of each other in
% two different colors. These are the two basis vectors on which we will
% project our data.

figure;
plot(coeff(:,1));
hold on;
plot(coeff(:,2));
title('First two principal components');

% 5. Compute the matrix Y = P T X. Note that this projects the data onto
% the two first principal components to reduce the data points in R512
% to points in R2.

Y = coeff(:,1:2)'*X;

% 6. Compute the matrix  ̃B = P Y , i.e., transform the data points in R2
% again to points in R512 by using them as coefficients with respect to
% the (orthonormal) basis formed by the two first principal component.

B = coeff(:,1:2)*Y;

% 7. Reconstruct the data points in X from the matrix  ̃B (by adding the
% mean again), and put the result in the matrix  ̃X.

X_tilde = B + mu';

% 8. Create a new figure. Plot the first spectrum in X (in blue) and the
% first spectrum in  ̃X (in red) on top of each other. You should now be
% able to distinguish two resonance peaks in the spectrum. These can
% be used to identify the ratio with which the two main components are
% mixed in the tissue sample. Note how the noise is clearly reduced.

figure;
plot(X(:,1));
hold on;
plot(X_tilde(:,1));
title('First spectrum and denoised spectrum');

% 9. We have hidden an outlier sample somewhere in the data correspond-
% ing to a different tissue sample than the rest. Use PCA to find it, and
% plot the (original) spectrum of the outlier. Can you see why it is an
% outlier?

[coeff,score,latent,tsquared,explained,mu] = pca(X');
figure;
plot(explained);
title('Explained variance');

% 10. Plot all denoised spectra in  ̃X.
% Can you recognize the common structure they have?
% Note that the outlier also shows a dip in one of these resonance frequencies,
% although its original spectrum does not have a peak there. Can you
% explain why it appears here?

figure;
plot(X_tilde);
title('Denoised spectra');
