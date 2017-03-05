addpath(genpath('functions'));
addpath(genpath('../Images'));

%Read 10 mugshot images
mug1 = readImg('mugshot1.jpg');
printImg(mug1, 'Original Mugshot');
[edges, clearEdges, enhanced, amplified_enhancments] = mask(mug1); %returns 4 images

%printing out images to user
printImg(edges, 'Laplacian Mask Edges');
printImg(clearEdges, 'Amplified Laplacian Mask Edges');
printImg(enhanced, 'Regular Edge Enhancements using Laplacian mask');
printImg(amplified_enhancments, 'Amplified Edge Enhancements');
imshow(amplified_enhancments, [.25, .75]);