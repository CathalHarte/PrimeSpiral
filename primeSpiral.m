% Takes the dimension of the square, and the pixel to number ratio as
% input, creates the prime spiral pixelmap
clear
close all

dim = 199; % Dimension should be odd, so that there is a center pixel
% Which is 1
dimsquared = dim^2;
ratio = 1;
primeDots = ~isprime(1:dimsquared);
Spiral = zeros(dim);
center = ceil(dim/2);
euclid = [ center; center ];
turn = [ 0 0; 1 0 ];
rim = [1 0 0]';
% rim_i is the layer
% rim_j is the edge, so we go from 0 - 3
% The length of edge is 2*rim_i
% rim_k is how far along that edge we have progressed
for i = 1:dimsquared
    if rim(2) == 0 % Todo: make this piece of logic into a concise function
        euclid(1) = center - rim(1) + rim(3);
        euclid(2) = center + rim(1);
    elseif rim(2) == 1
        euclid(1) = center + rim(1);
        euclid(2) = center + rim(1) - rim(3);
    elseif rim(2) == 2
        euclid(1) = center + rim(1) - rim(3);
        euclid(2) = center - rim(1);
    else 
        euclid(1) = center - rim(1);
        euclid(2) = center - rim(1) + rim(3);
    end
    Spiral(euclid(1)+1, euclid(2)+1) = primeDots(i);
    rim(3) = rim(3) + 1; % Overflow logic
    if rim(3) == 2*rim(1)
        rim(3) = 0;
        rim(2) = rim(2) + 1;
        if rim(2) > 3
            rim(2) = 0;
            rim(1) = rim(1) + 1;
        end
    end
end


figure
imshow(Spiral,[]);