function DrawTriangle(Triangle)
    TriangleColor = uisetcolor('Selecciona el color de los triangulos');
    for tr=1:Triangle
        LT = input('Ingresa la altura del triangulo: ');
        HT = input('Ingresa el ancho del triangulo: ');
        fprintf('Con clic derecho ingresa las coordenadas del extremo inferior izquierdo del triangulo con clic derecho');
        fprintf('%d',tr);
        fprintf('\n');
        [xt,yt] = getpts;
        XTr = [xt; xt; xt+HT];
        YTr = [yt; yt+LT; yt];
        patch(XTr,YTr,TriangleColor)
    end
end