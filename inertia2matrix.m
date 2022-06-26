function M = inertia2matrix(iner)
    M = diag([1:iner(1), 0*(1:iner(2)), -(1:iner(3))]);
end