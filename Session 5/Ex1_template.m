clear
close all

% Load image
im=rgb2gray(imread('baboon.png'));

% Show image
imshow(im);

%Convert image to double (to make computations)
im=double(im);

% TO COMPLETE: Apply Single Value Decomposition on the image
[U,S,V]=svd(im);

% TO COMPLETE: Reorder singular values in decreasing order
singular_values=1:rank(im);

% TO COMPLETE: Reorder U and V in decreasing singular value order
U=U(:,singular_values);
V=V(:,singular_values);

% TO COMPLETE: Plot singular values
figure
x=1:rank(im);
plot(x,diag(S));
title('Singular values')

%%
% Reconstruct image using 5, 10, 15, 50, 70 and 100 singular values
nb_kept=[5,10,15,50,70,100];
% Number of elements in nb_kept
nb_test=length(nb_kept);

figure
set(gcf, 'Position',  [100, 100, 1000, 1000])
for k=1:nb_test
   
    % TO COMPLETE: Keep only the first "nb_kept(k)" elements
    S_reduced=S(1:nb_kept(k),1:nb_kept(k));
    
    % TO COMPLETE: Reconstruct image
    im_reconstructed=U(:,1:nb_kept(k))*S_reduced*V(:,1:nb_kept(k))';
    
    % TO COMPLETE: Compute compression ratio
    compression_ratio=nb_kept(k)*rank(im)/(size(im,1)*size(im,2));
    % This is compression because we are keeping a few singular values instead
    % of storing all the pixels of the image.

    % The optimal nb of singular values to keep is a balance between the
    % compression ratio and the quality of the reconstructed image.
    % In terms of the singular values plot, the optimal nb of singular
    % values to keep is the point where the singular values start to
    % decrease slowly. This is the point where the information is
    % concentrated in the first singular values and the rest of the
    % singular values are not as important to a good reconstruction.

    % Plotting
    im_reconstructed=uint8(im_reconstructed);
    subplot(3,2,k);
    imshow(im_reconstructed)
    title({['Keeping ',num2str(nb_kept(k)),' singular values'] ['Compression ratio: ',num2str(compression_ratio)]})
    
end


