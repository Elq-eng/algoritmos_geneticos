function DrawTriangleToShow(Triangle, TriangleData)
    for tr=1:Triangle
        TriangleColor = TriangleData(tr,1:3);
        LT = TriangleData(tr,4);
        HT = TriangleData(tr,5);
        xt = TriangleData(tr,6);
        yt = TriangleData(tr,7);
        XTr = [xt; xt; xt+HT];
        YTr = [yt; yt+LT; yt];
        patch(XTr,YTr,TriangleColor)
    end
end