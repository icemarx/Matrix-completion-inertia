function izris_politopa(dimM, r1, r2, r3, r4, l1, l2, l3)
    %%%%%%%%%%%%%%%
    %%% DRAWING %%%
    %%%%%%%%%%%%%%%
    a=linspace(0,dimM+1);
    c=linspace(0,dimM+1);

    % prva neenakost
    clf;
    plot(r1*ones(100,1),c) 
    hold on
    plot(l1*ones(100,1),c)

    % druga neenakost
    plot(a,r2*ones(100,1))
    plot(a,l2*ones(100,1))

    % tretja neenakost
    plot(a',(a- r3*ones(100,1)'))
    plot(a',(a- l3*ones(100,1)'))

    % cetrti pogoj
    plot(a',r4*ones(100,1)'-a)


    %hold on
    x=0:1:dimM+1;
    y=0:1:dimM+1;
    [X,Y]=meshgrid(x,y);
    gridXY = [X(:), Y(:)];
    gridXY(gridXY(:,1)>r1, :) = nan;
    gridXY(gridXY(:,1)<l1, :) = nan;
    gridXY(gridXY(:,2)>r2, :) = nan;
    gridXY(gridXY(:,2)<l2, :) = nan;
    gridXY(gridXY(:,1)-gridXY(:,2)>r3, :) = nan;
    gridXY(gridXY(:,1)-gridXY(:,2)<l3, :) = nan;
    gridXY(gridXY(:,1)+gridXY(:,2)>dimM, :) = nan;
    plot(gridXY(:,1),gridXY(:,2),'*r')

    %%% ARROWS CODE
    % determine position of the axes
    axp = get(gca,'Position');

    % determine startpoint and endpoint for the arrows 
    xs=axp(1);
    xe=axp(1)+axp(3)+0.04;
    ys=axp(2);
    ye=axp(2)+axp(4)+0.05;

    % make the arrows
    annotation('arrow', [xs xe],[ys ys]);
    annotation('arrow', [xs xs],[ys ye]);

    axis equal
    axis on
    xlabel('a')
    ylabel('c')
    axis ([0 dimM+1 0 dimM+1])
    % set(gca,'XTick',[], 'YTick', [])
    title('Inercijski politop')
    legend('pogoj 1 (DN)', 'pogoj 1 (LN)', 'pogoj 2 (DN)', 'pogoj 2 (LN)', 'pogoj 3 (DN)', 'pogoj 3 (LN)', 'pogoj 4', 'veljavna toèka')
    
    % set window size
    pos = get(gcf, 'Position');
    set(gcf, 'Position', [pos(1), pos(2), 500, 475]);
end