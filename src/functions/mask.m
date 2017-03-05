%takes in an image and finds the edges of the image, returns 2 images which
%illustrate edges and 2 enhanced versions of that image
function [img_edges, amplified_edges, enhancedImg1, enhanced_Amplified_img] = mask( img )


imgSz = size(img); % read in image size
rowLength = imgSz(1,1); % M length
colLength = imgSz(1,2); %N length
row_boundary = rowLength - 1; % since the laplacian mask is a 3x3 matrix I will only be evaluating the pixels which are not on the outer edges of the MxN images... 
col_boundary = colLength -1; %...Those pixels will remain their original values without any masking
laplacian_mask = [0,1,0; 1, -4, 1; 0,1,0];%laplacian mask which will be used to find edges in an image
img_edges = zeros(rowLength, colLength); % initialize output array

for J = 2:row_boundary
    for I = 2: col_boundary
        img_matrix = [img(J-1, I-1:I+1); img(J, I-1: I+1); img(J+1, I-1:I+1);]; %reading in the 3x3 values of the image centered around a pixel at I,J
        temp_matrix = laplacian_mask .* img_matrix; %multiplies the image matrix against the laplacian mask
        sumCol = sum(temp_matrix); % sums the 3x3 matrix into a 1x3 matrix holding the sum of each column
        sumTotal = sum(sumCol); % sums all of the columns into a singl value representing the sum of the entire matrix
        img_edges(J,I) = sumTotal; % update the image value
    
    
    end
    
end



amplified_edges = zeros(rowLength, colLength); % initialize output array which will have an amplified image of the edges
for K = 1: rowLength*colLength
    if img_edges(K) < 0 %if a pixel value is less then 0 then it's a dark pixel so let's enhance it a bit to make it more clear that it's an edge
        amplified_edges(K) = img_edges(K)*4; % enhancing the edges by a scale of 4
    else
        amplified_edges(K) = img_edges(K); 
    end
    
end

%enhanced = img + outputImage;
enhancedImg1 = img - img_edges;
enhanced_Amplified_img = img - amplified_edges;

end