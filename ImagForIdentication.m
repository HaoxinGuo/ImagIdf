%% Load Image
rgb = imread('DetectCirclesExample_01.png');
imshow(rgb)
%% Determine Radius Range for Searching Circles
d = imdistline;
delete(d)
%% Initial Attempt to Find Circles
gray_image = rgb2gray(rgb);
imshow(gray_image)
[centers,radii] = imfindcircles(rgb,[35 43],'ObjectPolarity','dark');
%% Step 4: Increase Detection Sensitivity
[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
    'Sensitivity',0.9);
Step 5: Draw the Circles on the Image
imshow(rgb)
h = viscircles(centers,radii);
[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
    'Sensitivity',0.92);
length(centers)
delete(h)  % Delete previously drawn circles
h = viscircles(centers,radii);
%% Step 6: Use the Second Method (Two-stage) for Finding Circles
[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
          'Sensitivity',0.92,'Method','twostage');

delete(h)
h = viscircles(centers,radii);
[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
          'Sensitivity',0.95);
delete(h)
viscircles(centers,radii);
%% Step 7: Why are Some Circles Still Getting Missed?
imshow(gray_image)
%% Step 8: Find 'Bright' Circles in the Image
[centersBright,radiiBright] = imfindcircles(rgb,[20 25], ...
    'ObjectPolarity','bright','Sensitivity',0.92);
%% Step 9: Draw 'Bright' Circles with Different Color
imshow(rgb)
hBright = viscircles(centersBright, radiiBright,'Color','b');
%% Step 10: Lower the Value of 'EdgeThreshold'
[centersBright,radiiBright,metricBright] = imfindcircles(rgb,[20 25], ...
    'ObjectPolarity','bright','Sensitivity',0.92,'EdgeThreshold',0.1);
delete(hBright)
hBright = viscircles(centersBright, radiiBright,'Color','b');
%% Step 11: Draw 'Dark' and 'Bright' Circles Together
h = viscircles(centers,radii);