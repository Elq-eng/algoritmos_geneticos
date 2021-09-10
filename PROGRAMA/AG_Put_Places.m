%Este programa fue hecho por 
%Juan Andres Baldion Gongora
%Elquin Mauricio Cascavita Rios
%Alvaro Jose Cabal Millan
%A cutting plane algorithm for the site layout planning problem with travel barriers
%Este programa trata de solucionar un problema de ubicacion de lugares
%dentro de un espacio. El algoritmo fue diseñado para que en una
%construccion, se puedan ubicar los elementos de la construccion, tales
%como los baños, el lugar donde se mezcla el concreto, maquinaria, etc. El
%problema consiste en tener los lugares de las construcciones establecidos
%y poder generar un algoritmo que ubique todos esos elementos de la
%construccion en el menor espacio posible de tal forma que las distancias
%entre elementos sean las minimas y se ahorre mejor el espacio.

%Limpiamos datos previos, cerramos todo lo que haya abierto

clear all
close all
clc

%Definicion de algunas variables a utilizar
Dimensions = [];
ZonasTemporales = [];
Quantity = [];

%El primer paso dentro del programa es definir todo el terreno en el que se
%va a realizar la construccion, para esto, se le pregunta al usuario las
%dimensiones del terreno en el que se realizara la construccion

fprintf('Ingrese las dimensiones en metros de la zona de construcción \n');
Dimensions(1,1) = input('Ingrese el ancho del lugar: ');
Dimensions(1,2) = input('Ingrese el largo del lugar: ');
while (Dimensions(1,1) <= 0) || (Dimensions(1,2) <= 0)
    fprintf('Las dimensiones deben ser mayor a 0. Vuelve a ingresarlas \n');
    Dimensions(1,1) = input('Ingrese el ancho del lugar: ');
    Dimensions(1,2) = input('Ingrese el largo del lugar: ');
end

%Se le va a mostrar al usuario una imagen de las dimensiones del lugar y el
%color que desee
ColorTerrain = DrawTerrain(Dimensions);

%Ahora el usuario va indicar las zonas de construccion, es decir, las zonas
%ya predefinidas en las cuales van a ir las edificaciones o demas elementos
[DataToDraw, NumbAreas] = DelimitAreas(Dimensions);

%El usuario define las dimensiones de las zonas temporales y cantidades
[ZonasTemporales, Quantity] = DefinitionTempAreas(ZonasTemporales, Quantity);

%Ahora el usuario indica la zona en la cual va a realizar la construccion y
%las dimensiones de la zona en donde posiciona las zonas temporales. Se
%realiza una validacion de que esas zonas quepan en la zona dada por el
%usuario
[Alto, Ancho, xTA, yTA] = ValidTempAreas(ZonasTemporales, Quantity);

%Se define el area en el que las zonas temporales son puestas y se inicia
%el algoritmo genetico, indicando el numero de individuos y generaciones.
SizeTempAreas=[Ancho Alto];
n_ind=16;
n_gen=16;
best_Ind = [];

%La poblacion inicial van a ser las posibles ubicaciones iniciales de las
%zonas temporales
pobIni=GenPobIni(ZonasTemporales,Quantity,SizeTempAreas,n_ind,xTA,yTA);

%Se crea un ciclo for en el cual se van a generar todas las generaciones
%propuestas, utilizando la seleccion, el cruce y la mutacion
for i=1:n_gen
      pobSel=Seleccion(pobIni);
      pobCru=Cruce(pobSel,SizeTempAreas,ZonasTemporales,Quantity);
      [pobMut,pobMutOrdered]=Mutacion(pobCru,SizeTempAreas,ZonasTemporales,Quantity);
      best_Ind = [best_Ind; pobMutOrdered(size(pobMutOrdered,1))];
      pobSel=pobMutOrdered;
end

[pobIni, pobSel, pobCru, pobMutOrdered, best_Ind] = AdjustParameters(pobIni, pobSel, pobCru, pobMutOrdered, best_Ind ,xTA, yTA);

%Grafica poblacion inicial
figure
for i=1:n_ind
    subplot(sqrt(n_ind),sqrt(n_ind),i);
    DrawTerrainToShow(Dimensions, ColorTerrain);
    DelimitAreasToShow(Dimensions, DataToDraw, NumbAreas);
    DrawCutingPlan(pobIni(i,1).gen,SizeTempAreas);
end

%Grafica poblacion seleccionada
figure
for i=1:n_ind
    subplot(sqrt(n_ind),sqrt(n_ind),i);
    DrawTerrainToShow(Dimensions, ColorTerrain);
    DelimitAreasToShow(Dimensions, DataToDraw, NumbAreas);
    DrawCutingPlan(pobSel(i,1).gen,SizeTempAreas);
end

%Grafica poblacion cruzada
figure
for i=1:n_ind
    subplot(sqrt(n_ind),sqrt(n_ind),i);
    DrawTerrainToShow(Dimensions, ColorTerrain);
    DelimitAreasToShow(Dimensions, DataToDraw, NumbAreas);
    DrawCutingPlan(pobCru(i,1).gen,SizeTempAreas);
end

%Grafica de la poblacion mutada
figure
for i=1:n_ind
    subplot(sqrt(n_ind),sqrt(n_ind),i);
    DrawTerrainToShow(Dimensions, ColorTerrain);
    DelimitAreasToShow(Dimensions, DataToDraw, NumbAreas);
    DrawCutingPlan(pobMut(i,1).gen,SizeTempAreas);
end

%Grafica de los mejores individuos
figure
for i=1:n_ind
    subplot(sqrt(n_ind),sqrt(n_ind),i);
    DrawTerrainToShow(Dimensions, ColorTerrain);
    DelimitAreasToShow(Dimensions, DataToDraw, NumbAreas);
    DrawCutingPlan(best_Ind(i,1).gen,SizeTempAreas);
end


