function izrek_2_8(A, B, C, D, E)
    % A - Hermitska n1 x n1 matrika
    % B - n1 x n2 matrika
    % C - Hermitska n2 x n2 matrika
    % D - n2 x n3 matrika
    % E - Hermitska n2 x n2 matrika
    
    % M(X) = (A  B  X)
    %        (B* C  D)
    %        (X* D* E)
    
    inercija_1 = naivni_izracun_inercije([A, B; B', C]);
    a1 = inercija_1(1);
    b1 = inercija_1(2);
    c1 = inercija_1(3);
    inercija_2 = naivni_izracun_inercije([C, D; D', E]);
    a2 = inercija_2(1);
    b2 = inercija_2(2);
    c2 = inercija_2(3);
    
    n1=length(A);     % dimenzija A
    n2=length(C);     % dimenzija C
    n3=length(E);     % dimenzija E
    dimM = n1+n2+n3;
    
    r = rank([B' C  D]);
    p = max(a1 - rank([B' C]), a2 - rank([C D]))+r;
    q = max(c1 - rank([B' C]), c2 - rank([C D]))+r;
    
    
    
    %%% INEQUATIONS
    r1=min(n1+a2, n3+a1);  % desna stran prve neenakosti
    r2=min(n1+c2, n3+c1);  % desna stran druge neenakosti
    r3=a1+a2-r;            % desna stran tretje neenakosti
    r4=n1+n3+r;            % cetrti pogoj

    l1=p;               % leva stran prve neenakosti
    l2=q;               % leva stran druge neenakosti
    l3=r-c1-c2;         % leva stran tretje neenakosti
    
    
    
    izris_politopa(dimM, r1,r2, r3, r4, l1, l2, l3);
end