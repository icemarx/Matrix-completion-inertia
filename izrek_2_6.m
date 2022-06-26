function izrek_2_6(A, B)
    % A - Hermitska n x n matrika
    % B - Hermitska m x m matrika
    
    % M(X) = (A  X)
    %        (X* B)
    
    inercija_1 = naivni_izracun_inercije(A);
    a1 = inercija_1(1);
    b1 = inercija_1(2);
    c1 = inercija_1(3);
    inercija_2 = naivni_izracun_inercije(B);
    a2 = inercija_2(1);
    b2 = inercija_2(2);
    c2 = inercija_2(3);
    
    n=a1+b1+c1;     % dimenzija A
    m=a2+b2+c2;     % dimenzija B
    dimM = n+m;
    
    
    
    %%% INEQUATIONS
    r1=min(a1+m,a2+n);  % desna stran prve neenakosti
    r2=min(c1+m,c2+n);  % desna stran druge neenakosti
    r3=a1+a2;           % desna stran tretje neenakosti
    r4=n+m;             % cetrti pogoj

    l1=max(a1,a2);      % leva stran prve neenakosti
    l2=max(c1,c2);      % leva stran druge neenakosti
    l3=-c1-c2;          % leva stran tretje neenakosti
    
    
    izris_politopa(dimM, r1, r2, r3, r4, l1, l2, l3);
end