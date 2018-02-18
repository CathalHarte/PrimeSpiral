% Takes the dimension of the square, and the pixel to number ratio as
% input, creates the prime spiral pixelmap
close all

dim = 199; % Dimension should be odd, so that there is a center pixel
% Which is 1
dimsquared = dim^2;
ratio = 1;
primeDots = ~isprime(1:dimsquared);
Spiral = zeros(dim);
center = ceil(dim/2);
euclid = [ center center ];
turn = [ 0 0; 1 0 ];
rim = [ 0 0 ]'; % Coordinate system for the spiral arranged as 
    % [layer, displacement around that layer from the bottom right corner]'
% The length of each rim_i,j layer j is from 1 upwards  8*(j)
for i = 1:dimsquared
    Spiral(euclid(1), euclid(2)) = primeDots(i);
    if rim(2) - 8*(rim(1)) == 0
        rim(1) = rim(1) + 1;
        rim(2) = 1;  
        euclid = center + [ rim(1) rim(1) ];
    else
        rim(2) = rim(2) + 1;
        euclid = euclid + [ 1 0 ];
        euclid = euclid + [ 0 1 ];
        euclid = euclid + [ -1 0 ];
        euclid = euclid + [ 0 -1 ];
    end
end


figure
imshow(Spiral,[]);