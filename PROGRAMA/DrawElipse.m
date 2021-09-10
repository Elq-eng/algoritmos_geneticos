function DrawElipse(Elipse)
    ElipseColor = uisetcolor('Selecciona el color de los circulos');
    for e=1:Elipse
        RadiusEli = input('Ingresa el radio de la elipse: ');
        RE = input('Ingresa la relacion de ancho-largo de la elipse: ');
        fprintf('Ingrese las coordenadas del centro del lugar haciendo clic derecho en la zona que desea posicionar el circulo ');
        fprintf('%d',e);
        fprintf('\n');
        [xe,ye] = getpts;
        te = linspace(0, 2*pi);
        re = RadiusEli;
        xeli = (RE)*re*cos(te)+xe;
        yeli = re*sin(te)+ye;
        patch(xeli, yeli, ElipseColor)
    end
end