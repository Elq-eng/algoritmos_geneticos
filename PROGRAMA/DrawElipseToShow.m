function DrawElipseToShow(Elipse, ElipseData)
    for e=1:Elipse
        ElipseColor = ElipseData(e,1:3);
        RadiusEli = ElipseData(e,4);
        RE = ElipseData(e,5);
        xe = ElipseData(e,6);
        ye = ElipseData(e,7);
        te = linspace(0, 2*pi);
        re = RadiusEli;
        xeli = (RE)*re*cos(te)+xe;
        yeli = re*sin(te)+ye;
        patch(xeli, yeli, ElipseColor)
    end
end