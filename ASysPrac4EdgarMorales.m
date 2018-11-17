%% Pr�ctica 4: Convoluci�n y Correlaci�n de se�ales en tiempo continuo
%
%%   Portada
% *Intituto Polit�cnico Nacional*
%
% *Unidad Profecional Interdiciplinaria en Ingenier�a y Tenolog�as
% Avanzadas*
%                         
% *An�lisis de se�ales y sistemas*
%
% *Pr�ctica 3: Se�ales en tiempo discreto.*
% Grupo: *2MV1*
%
% Profesor: *Dr. Rafael Martinez Martinez*
%  
% Integrantes:
%
% *Calva Lima Leonardo Ashley*
%
% *Escarcega Corona Luis*
%
% *Morales Sanabria Edgar Esteban*
    %% Objetivo
    % Los objetivos son los siguientes:
%
% 1) Conocer m�todos b�sicos de integraci�n num�rica
%
% 2) Manipulaci�n de instrucciones en MATLAB
%
% 3) Simular convoluciones y correlaciones de se�ales continuas
%
% 4) Simular convoluciones y correlaciones de se�ales discretas
%% Introducci�n
%
% CONVOLUCI�N
%
% Dadas dos funciones sea x(t) y f(t) aquellas funciones sobre las cuales
% se aplicar� la operaci�n de convoluci�n para generar una nueva funci�n g(t)
% las diferentes notaciones ind�can alguno de los distintos m�todos para
% desarrollar la convoluci�n de dichas funciones.
% 
% Notaci�n 1 
%
%           f(t)*x(t)=g(t); Donde g(t) es una nueva funci�n en el dominio del tiempo. 
%
% Notaci�n 2
%
%           g(t) = @(t) (f(t)*x(t-T))
%           g(t) = @(t)integral(g(t),T,-inf,inf)
%
%           La convoluci�n tambi�n puede ser escrita mediante un producto de las funciones dentro de una integral
%           definida con limites desde menos infinito hasta infinito. En ambas funciones se aplica un cambio de 
%           variable sobre el cual se integrar�; as� mismo se aplica una inversi�n horizontalmente a una de las 
%           se�ales y se aplica un desplazamiento horizontal con la variable original.
% 
% M�todos de resolver la convoluci�n.
%
% Dicho esto es posible entonces a partir de la integraci�n obtener dos m�todos de visualizar la gr�fica resultante de la
% convoluci�n de dos se�ales. 
% El primer m�todo consiste b�sicamente en resolver la integral evaluado los l�mites respecto del dominio de la 
% funci�n donde el cambio de variable no contiene traslaci�n. Este m�todo suele ser el m�s complejo debido al desarrollo
% de las integrales y los respectivos l�mites a evaluar. 
%
% El segundo m�todo es llamado el m�todo "Gr�fico" debido a que para este se inicia graficando ambas se�ales con algunos
% cambios sobre las gr�ficas de las se�ales ser� posible hallar los l�mites de integraci�n sin realizar la misma cantidad
% de integrales que en el m�todo anal�tico. El segundo paso es aplicar un cambio de variable f(t)=f(T) a una de las 
% se�ales;  donde T es la nueva variable sobre el eje horizontal. A esta funci�n se le "Fija" sobre el eje horizontal,
% o en otras palabras solo se grafica tal cual est� definida sin realizar alg�n otro cambio.
%           
% A la segunda se�al se le aplica el cambio de variable x(t)=x(-T) lo cual se puede interpretar como una inversi�n
% horizontal de la se�al. Posteriormente para que ambas se�ales generen una nueva se�al la se�al x(t-T) es desplazada al
% asignarle valores a la variable t entre un intervalo que incluya el dominio de la funci�n f(T). De esta manera la integral 
% resultate ser�, dependiendo de la naturaleza de las funciones, una integral que se podr� dividir en una suma de integrales 
% con distintos l�mites de integraci�n. La funci�n resultante de esta suma resultante de integrales pertence al espacio del
% tiempo al ser evauada y es llamada g(t).
%           
% CORRELACI�N
% 
% Dadas dos funciones sea x(t) y f(t) aquellas funciones sobre las cuales se aplicar� la operaci�n de correlaci�n para generar
% una nueva funci�n g(t) las diferentes notaciones ind�can alguno de los distintos m�todos para desarrollar la convoluci�n de
% dichas funciones.
%  
% Notaci�n 1 
%
%           f(t)�x(t)=g(t); Donde g(t) es una nueva funci�n en el dominio del tiempo. 
%
% Notaci�n 2
%
%           g(t) = @(t) (f(t)*x(t+T))
%           g(t) = @(t)integral(g(t),T,-inf,inf)
%
% Dadas las formas matem�ticas descritas anteriormente, es posible intuir a simple vista la similitud entre la convoluci�n y la
% correlaci�n en las Notaciones n�mero 2; dicho lo anterior se infiere que la correlaci�n se puede llegar a resolver mediante 
% las dos t�cnicas antes descritas de convoluci�n. Esto es, operando sobre una de las variables un cambio de variable, pero sin
% inversi�n, y un desplazamiento.
% 
    %% Problema 1
% Para el PR04 reporte la grafica de la simulaci�n n�merica de la convoluci�n y compare con el resultado an�litico que obtuvo para el problema 1, esto es, su pr�ctica tendr� que incluir una llamada a la funci�nn convconm y posteriormente se tendr� que mostrar (mediante el Publish) la gr�fica tanto de las se�ales involucradas como el resultado de la convoluci�n, y en esta �ltima gr�ficara su resultado analitico, se tendr� que incluir el resultado analitico.
% 
% Se tienen las siguientes se�ales f(t) y x(t) en la gr�fica 1; la
% convoluci�n anal�tica y as� como utilizando un software _convconm_ para una
% aproximaci�n num�rica  en la gr�fica 2.
%
%%
c = @(t) t.*(t>=-1&t<1);
v = @(t) exp(-t).*(t>=0&t<1);
convconm(c,v)
hold on
%%
% C�digo de la funci�n g(t) generada anal�ticamente se mira en colores azul, naranja y amarillo contra el gris del c�digo del software.
fplot(@(t) (t+2*exp(-t-1)-1),[-1 0])
fplot(@(t) ((2-t)*exp(-1)+t-1),[0 1])
fplot(@(t) ((2-t)*exp(-1)),[1 2])
hold off    
 %%
    %% Problema 2
% Para el PR05 reporte la grafica de la simulaci�n n�merica de la correalci�n y compare con el resultado an�litico que obtuvo para el problema e), esto es, su pr�ctica tendr� que incluir una llamada a la funci�nn convconm y posteriormente se tendr� que mostrar (mediante el Publish) la gr�fica tanto de las se�ales involucradas como el resultado de su correlaci�n, y en esta �ltima graficara su resultado analitico, se tendr� que incluir el resultado analitico.
%
% Problema D
%
 x = @(t) 1*(t>=0 & t<2)-1*(t>=2 & t<4);
 h= @(t) -1*(t>=-4 & t<-2)+1*(t>=-2 & t<0);
convconm(h,x)
%%
% Problema E
%
 y = @(t) 0*(t<0)+1*(t>=0 & t<3)-1*(t>=3 & t<4);
 i= @(t) -1*(t>=-4 & t<-3)+1*(t>=-3 & t<0);
 convconm(i,y)
 %%
%% Problema 3 
% Realice la simuaci�n de la convoluci�n de las se�ales (c) con (d) del problema 3.1.1
%      
% Para esta simulaci�n se utilizar� un software visto en clase. 
%%
 n= -4:6;
 m= -3:5;
 j= [0 -9 -6 -3 0 3 6 9 0 0 0];
 k= [0 4 2 0 2 4 0 0 0];
 convdisc([n;j],[m;k])
    %% Problema 4
% Realice la simuaci�n de la correlaci�n de las se�ales (c) con (d) del problema 3.1.1
%
% Para esta simulaci�n se utilizar� el mismo software solo que se har� una modificaci�n para que en el t�tulo de las gr�ficas ind�que que es la "CORRELACI�N" y no la "CONVOLUCI�N". 
%%
 n= -4:6;
 m= -3:5;
 j= [0 -9 -6 -3 0 3 6 9 0 0 0];
 k= [0 4 2 0 2 4 0 0 0];
 corrdisc([n;j],[-m;k])
 %%
    %% Problema 5
% Realice la la convoluci�n de las se�ales (c) con (d) del problema 3.1.1 utilizando el comando conv de MATLAB, muestre el c�digo utilizado y gr�fique el resultado, sugerencia: Utilice las propiedades de traslaci�n de la convoluci�n.
%%
% 
   c=[-9 -6 -3 0 3 6 9];
   d=[4 2 0 2 4];
   n=conv(c,d);
   u=[-5 -4 -3 -2 -1 0 1 2 3 4 5];   
   stem(u,n)
%% Referencias
%
% Dr. Rafael Martinez Martinez. (2016). Se ?nales y Sistemas. 2018, de creativecommons.orgSitio web: http://rafneta.github.io/