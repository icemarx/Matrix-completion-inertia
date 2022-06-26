function isclique = je_klika(M)
    % M - hermitska matrika nxn, ki predstavlja graf H_G
    % isClique - true, ce je graf H_G povezan
    % O(n^2)
    
    isclique = true;
    if length(M) > 1
        for i = 1:length(M)
            for j = i+1:length(M)
                if ~(abs(M(i, j)) > 0)
                    isclique = false;
                end
            end
        end
    end
end