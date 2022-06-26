function izrek_2_7(A, B, n3)
    % A - Hermitska n1 x n1 matrika
    % B - Hermitska n2 x n2 matrika
    
    % M(X) = (A  X  Y)
    %        (X* B  Z)
    %        (Y* Z* W)
    
    inercija_1 = naivni_izracun_inercije(A);
    a1 = inercija_1(1);
    b1 = inercija_1(2);
    c1 = inercija_1(3);
    inercija_2 = naivni_izracun_inercije(B);
    a2 = inercija_2(1);
    b2 = inercija_2(2);
    c2 = inercija_2(3);
    
    n1=a1+b1+c1;     % dimenzija A
    n2=a2+b2+c2;     % dimenzija B
    % n3;              % dimenzija W
    dimM = n1 + n2 + n3;
    
    
    
    %%% INEQUATIONS
    r1=min(a1+n2,a2+n1)+n3;  % desna stran prve neenakosti
    r2=min(c1+n2,c2+n1)+n3;  % desna stran druge neenakosti
    r3=a1+a2+n3;             % desna stran tretje neenakosti
    r4=n1+n2+n3;             % cetrti pogoj

    l1=max(a1,a2);      % leva stran prve neenakosti
    l2=max(c1,c2);      % leva stran druge neenakosti
    l3=-c1-c2-n3;       % leva stran tretje neenakosti
    
    
    izris_politopa(dimM, r1, r2, r3, r4, l1, l2, l3);
    
end