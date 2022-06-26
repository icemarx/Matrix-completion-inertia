function sigma = mls(H)
    % input
    % H - matrika, katere nicelne vhode lahko predstavimo kot graf H_G
    % output
    % ureditev vozlisc, ki je popolna shema grafa H_G, ce je H_G tetivni
    % O(n^2)
    
    
    n = length(H);
    V = 1:n;
    sigma = -ones(1, n);
    labels = zeros(1, n);
    
    % O(n^2)
    for i = n:-1:1
        % choose a vertex x in V \ sigma whose label is maximal
        % O(n)
        index = 0;
        max_label = -1;
        for j = n:-1:1
            if V(j) > 0 && labels(j) > max_label
                index = j;
                max_label = labels(j);
            end
        end
        x = V(index);
        V(index) = 0;
        
        % increment labels of neighbors
        % O(n)
        for j = 1:n
            if index ~= j && abs(H(index, j)) > 0
                labels(j) = labels(j) + 1;
            end
        end
        
        % place vertex x into output set
        sigma(i) = x;
    end
end