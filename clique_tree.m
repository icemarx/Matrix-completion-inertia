function [T, Sep] = clique_tree(H, sigma)
    % input
    % H - povezan tetivni graf
    % sigma - popolna ureditev grafa H
    % output
    % T - drevo klik
    % Sep - mnozica minimalnih lociteljev grafa H
    
    n = length(H);
    V = zeros(1, n);
    s = 1;
    K = {[]};
    E = {};
    clique = zeros(1,n);
    num_e = 0;
    Sep = [];
    num_sep = 0;
    
    % O(n^2)
    for i = n:-1:1
        x = sigma(i);
        S = [];
        
        % O(n)
        for j = 1:n
            if abs(H(sigma(i), j)) > 0
                S = [S, j];
            end
        end
        S = intersect(S, V);
        
        % O(n)
        p = 1;
        if i < n
            % O(s^2)
            if ~je_klika(H(S, S))
                % ne gre za tetivni graf
                % print("Graf ni tetivni")
                K = {[]};
                E = {};
                Sep = [];
                break
            end
            
            % O(n)
            for j = 1:n
                if sigma(j) == S(1)
                    k = j;
                    p = clique(sigma(k));
                    break;
                end
            end
        end
        
        if (isempty(K{p}) && isempty(S)) || isequal(K{p}, S)
            clique(x) = p;
        else
            s = s+1;
            K{s} = S;
            
            
            num_e = num_e + 1;
            E{num_e} = [p, s];
            num_sep = num_sep + 1;
            Sep{num_sep} = S;
            
            clique(x) = s;
        end
        
        K{clique(x)} = union(K{clique(x)}, x);
        V(i) = x;
    end
    
    T = {K, E};
end