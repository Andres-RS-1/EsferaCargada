% Parametros del problema
radius_sphere = 0.1;  % Radio de la esfera en metros. Define el tamaño de la esfera.
charge_sphere = 1e-6;  % Carga en la esfera en Coulombs. Determina la cantidad de carga en la esfera.

% Definir un dominio de calculo
% Se crea una cuadricula de puntos en el plano XY para calcular el potencial electrico en un rango especifico.
% La funcion meshgrid genera matrices 2D de coordenadas X e Y.
% Aqui, los puntos en X y Y varian desde -0.5 a 0.5 en incrementos de 0.01 metros, proporcionando una malla fina y uniforme.
[x, y] = meshgrid(-0.5:0.01:0.5, -0.5:0.01:0.5);

% Calcular el potencial electrico debido a la esfera cargada
epsilon_0 = 8.85e-12;  % Permitividad electrica del vacio en Faradios por metro. Es una constante fundamental que describe como se propagan los campos electricos en el vacio.
% Se utiliza la formula del potencial electrico para una carga puntual para calcular el potencial electrico en cada punto del dominio.
% El potencial electrico en un punto debido a una carga puntual esta dado por k * q / r, donde k es la constante de Coulomb, q es la carga y r es la distancia desde la carga al punto.
potential_sphere = (1 / (4 * pi * epsilon_0)) * (charge_sphere ./ sqrt((x.^2 + y.^2 + radius_sphere^2)));

% Calcular el potencial electrico del plano conductor a potencial cero
% En un plano conductor conectado a tierra, el potencial electrico se considera cero en todos los puntos.
% Por lo tanto, se crea una matriz de potenciales cero con las mismas dimensiones que la cuadricula de calculo.
potential_conductor = zeros(size(x));

% Sumar los potenciales para obtener el potencial total
% El potencial electrico total en un punto es la suma del potencial debido a la esfera cargada y el potencial del plano conductor.
% Esto se hace punto a punto para obtener una matriz que representa el potencial total en todo el dominio.
total_potential = potential_sphere + potential_conductor;

% Graficar el potencial electrico en un grafico de contorno
% Se utiliza la funcion contour para graficar el potencial electrico en un grafico de contorno.
% Esto proporciona una representacion visual de como varia el potencial en el dominio.
contour(x, y, total_potential, 50); % Se generan 50 lineas de contorno para representar los diferentes valores del potencial.
xlabel('X (metros)'); % Etiqueta del eje X del grafico.
ylabel('Y (metros)'); % Etiqueta del eje Y del grafico.
title('Distribucion de Potencial Electrico'); % Titulo del grafico.
colorbar; % Se agrega una barra de color para interpretar los valores del potencial.
axis equal; % Se asegura que los ejes tengan la misma escala para una representacion precisa.

% Añadir un circulo para representar la esfera cargada
hold on; % Se indica que se mantenga el grafico actual para superponer otros elementos.
th = linspace(0, 2 * pi, 100); % Se crea un vector de angulos para dibujar un circulo.
x_circle = radius_sphere * cos(th); % Coordenadas X de los puntos del circulo.
y_circle = radius_sphere * sin(th); % Coordenadas Y de los puntos del circulo.
plot(x_circle, y_circle, 'r', 'LineWidth', 2); % Se grafica un circulo rojo para representar la esfera cargada.
legend('Potencial Electrico', 'Esfera Cargada'); % Se agrega una leyenda al grafico para identificar los elementos.
hold off; % Se finaliza la superposicion de elementos en el grafico.
