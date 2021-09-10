function DrawCircles(Circles)
    CircleColor = uisetcolor('Selecciona el color de los circulos');
    for c=1:Circles
        Radius = input('Ingresa el radio del circulo: ');
        fprintf('Ingrese las coordenadas del centro del lugar haciendo clic derecho en la zona que desea posicionar el circulo ');
        fprintf('%d',c);
        fprintf('\n');
        [xc,yc] = getpts;
        tc = linspace(0, 2*pi);
        r = Radius;
        xcir = r*cos(tc)+xc;
        ycir = r*sin(tc)+yc;
        patch(xcir, ycir, CircleColor)
    end
end