function DrawCirclesToShow(Circles, CircleData)
    for c=1:Circles
        Radius = CircleData(c,4);
        xc = CircleData(c,5);
        yc = CircleData(c,6);
        tc = linspace(0, 2*pi);
        r = Radius;
        xcir = r*cos(tc)+xc;
        ycir = r*sin(tc)+yc;
        patch(xcir, ycir, CircleData(c,1:3))
    end
end