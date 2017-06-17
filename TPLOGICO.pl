%pareja(Persona, Persona).
pareja(marsellus, mia).
pareja(pumkin, honeyBunny).
pareja(bernardo, bianca).
pareja(bernardo, chiaro).

%trabajaPara(Empleador, Empleado).
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).
trabajaPara(vincent, bernardo).
trabajaPara(winston,bernardo).
trabajaPara(bianca, george).
trabajaPara(chiaro, george).

saleCon(Persona1, Persona2) :-
	pareja(Persona1, Persona2),
	Persona1 \= Persona2.

saleCon(Persona2, Persona1) :-
	pareja(Persona1, Persona2),
	Persona2 \= Persona1.

trabajarPara(Empleador, Empleado):-
	trabajaPara(Empleador, Empleado).

esFiel(Persona):-
not(tieneMasDeUnaPareja(Persona)).

% Funciones Auxiliares:

tieneMasDeUnaPareja(Persona):-
	pareja(Persona, Amor1),
	pareja(Persona, Amor2),
	Amor1 \= Amor2.

%personaje(Nombre, Ocupacion).
personaje(pumkin,     ladron([estacionesDeServicio, licorerias])).
personaje(honeyBunny, ladron([licorerias, estacionesDeServicio])).
personaje(vincent,    mafioso(maton)).
personaje(jules,      mafioso(maton)).
personaje(marsellus,  mafioso(capo)).
personaje(winston,    mafioso(resuelveProblemas)).
personaje(mia,        actriz([foxForceFive])).
personaje(butch,      boxeador).
personaje(bernardo,   mafioso(cerebro)).
personaje(bianca,     actriz([elPadrino1])).
personaje(elVendedor, vender([humo, iphone])).
personaje(jimmie,     vender([auto])).

%encargo(Solicitante,Encargado,Tarea). 
encargo(marsellus, vincent,   cuidar(mia)).
encargo(vincent,  elVendedor, cuidar(mia)).
encargo(marsellus, winston, ayudar(jules)).
encargo(marsellus, winston, ayudar(vincent)).
encargo(marsellus, vincent, buscar(butch, losAngeles)).
encargo(bernardo, vincent, buscar(jules, fuerteApache)).
encargo(bernardo, winston, buscar(jules, sanMartin)).
encargo(bernardo, winston, buscar(jules, lugano)).

amigo(vincent, jules).
amigo(jules, jimmie).
amigo(vincent, elVendedor).

esPeligroso(Personaje) :-
	realizaActividadPeligrosa(Personaje).

esPeligroso(Personaje) :-
	encargo(Personaje,Jefe,_),
	realizaActividadPeligrosa(Jefe).

realizaActividadPeligrosa(Personaje) :-
	personaje(Personaje, mafioso(maton)).

realizaActividadPeligrosa(Personaje) :-
	personaje(Personaje, ladron(Lugares)),
	member(licorerias, Lugares).

% sanCayetano(Personaje) :- forall(losTieneCerca(Personaje), encargo(_,Personaje,_)).

% losTieneCerca(Personaje) :- findall(Cerca,amigo(Personaje,Amigo),AmigosCerca).