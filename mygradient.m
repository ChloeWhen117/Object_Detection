function [mag,ori] = mygradient(I)
%
% compute image gradient magnitude and orientation at each pixel
% Lecture 11 Slides 37

h_x = [-1,0,1;-2,0,2;-1,0,1];
h_y = transpose(h_x); 
%smooth image with a gaussian and estimates derivates
dx = imfilter(I, h_x, 'replicate');
dy = imfilter(I,h_y, 'replicate');

%edge strength = magnitude of the gradient vector
mag = sqrt(dx.^2 + dy.^2);
%orientation = gradient direction
ori =  atan2(dy,dx).*-180/pi;

