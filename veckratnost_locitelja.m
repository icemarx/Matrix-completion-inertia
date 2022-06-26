function v = veckratnost_locitelja(S, T)
    K = T{1};
    E = T{2};
    
    v = 0;
    for i = 1:length(E)
        if intersect(K{E{i}(1)}, K{E{i}(2)}) == S
            v = v+1;
        end
    end
end