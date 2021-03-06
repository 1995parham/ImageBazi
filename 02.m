pkg load image

clear

im_path = input ("Please enter image path: ", "s");

im_source = imread (im_path);

im_source = rgb2gray(im_source);
im_source = im2double(im_source);

printf ("Source image rank: %d\n", rank (im_source));

ks = input ("Please enter k(s) [...]: ");

for k = ks
	printf (" -- k = %d -- \n", k);

	[im_U, im_S, im_V] = svd (im_source);
	im_S(k+1:end,:) = 0;
	im_S(:,k+1:end) = 0;
	im_sink = im_U * im_S * im_V';

	im_path = input ("Please enter save path: ", "s");
	imwrite (im_sink, im_path);

	printf ("Mean Square Error: %g\n", mean (meansq (im_source - im_sink)));
endfor
