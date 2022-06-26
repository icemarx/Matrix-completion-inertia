function inercija = rekurzivni_izrek_3_7(M)
    % M - nxn hermitska matrika
    % inercija - inercija matrike M
    
    if length(M) == 1
        % matrika M je velikosti 1x1, torej je inercija trivialna
        % O(1)
        l = sign(M(1));
        if(l == -1)
            inercija = [0, 0, 1];
        elseif(l == 1)
            inercija = [1, 0, 0];
        else
            inercija = [0, 1, 0];
        end
    elseif det(M) == 0
        % matrika ni obrnljiva, izracunamo z naivnim pristopom
        inercija = naivni_izracun_inercije(M);
    else
        % matrika je obrnljiva
        M_inv = inv(M); % O(n^3)

        sigma = mls(M_inv); % O(n*m), napisano O(n^2)
        [T, cS] = clique_tree(M_inv, sigma); % O(n^2)
        cK = T{1};

        
        if length(cK) <= 1%  || ~je_tetivni
            inercija = naivni_izracun_inercije(M);
        else
            i_L = [0, 0, 0];
            for i = 1:length(cK)
                % [a, b, c] = izracun_inercije(M(cK{i}, cK{i}));
                % i_L = i_L + [a, b, c];
                i_L = i_L + rekurzivni_izrek_3_7(M(cK{i}, cK{i}));
            end

            i_R = [0, 0, 0];
            for i = 1:length(cS)
                % v_S = 1;
                v_S = veckratnost_locitelja(cS{i}, T);
                % [a, b, c] = izracun_inercije(M(cS{i}, cS{i}));
                % i_R = i_R + v_S * [a, b, c];
                i_R = i_R + v_S * rekurzivni_izrek_3_7(M(cS{i}, cS{i}));
            end

            inercija = i_L - i_R;
        end
    end
end