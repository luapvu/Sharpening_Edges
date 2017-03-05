function [ out ] = printImg( img, img_title )

figure, imshow(img, [min(img(:)), max(img(:))]); %prints image to screen
title(img_title); % Attaches specified title to the image
out = 0; % return a null value

end

