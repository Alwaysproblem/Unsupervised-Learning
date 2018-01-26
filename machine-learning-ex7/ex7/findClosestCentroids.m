function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

e = @(a,b) (a-b).^2; 


for i =  1:length(X)
    % the first method that I thought to compute the Euler distance. 
    %    mat_x =  repmat(X(i,:), K, 1);
    %    f = (mat_x - centroids).^2;
    %    euler = sum(f, 2);
    % but I use the suggestion from the tutor to compute the distance
    % faster than the first thought.
   tmp = bsxfun(e, X(i,:), centroids);
   euler = sum(tmp, 2);
   [~,idx(i)] = min(euler); 
end





% =============================================================

end

