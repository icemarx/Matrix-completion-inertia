function inercija = naivni_izracun_inercije(A)
    inercija = [0, 0, 0];
    ls = eig(A);
    for i = 1:length(ls)
        
        s = sign(ls(i));
        if abs(ls(i)) < 10 ^ (-10)
            s = 0;
        end
        
        if s == 1
            inercija = inercija + [1, 0, 0];
        elseif s == 0
            inercija = inercija + [0, 1, 0];
        else
            inercija = inercija + [0, 0, 1];
        end
    end
end