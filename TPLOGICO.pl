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

% saleCon/2 :

saleCon(Persona1, Persona2) :-       % Caso Base
	pareja(Persona1, Persona2),
	Persona1 \= Persona2.

saleCon(Persona2, Persona1) :-       % Caso Recursivo
	pareja(Persona1, Persona2),
	saleCon(Persona1, Persona2).

trabajarPara(Empleador, Empleado):-
	trabajaPara(Empleador, Empleado).

% esFiel/1:

esFiel(Persona):-
	saleCon(Persona,_),
	not(tieneMasDeUnaPareja(Persona)).

% acataOrden/2:

acataOrden(Persona, Jefe) :-          % Caso Base
	trabajaPara(Jefe, Persona).

acataOrden(OtraPersona, Jefe) :-      % Caso Recursivo
	trabajaPara(JefeDeOtraPersona, OtraPersona),
	acataOrden(JefeDeOtraPersona, Jefe).

% Predicados Auxiliar:

tieneMasDeUnaPareja(Persona):-
	pareja(Persona, Amor1),
	pareja(Persona, Amor2),
	Amor1 \= Amor2.

% Parte 2:

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

% esPeligroso/1:

esPeligroso(Personaje) :-
	realizaActividadPeligrosa(Personaje).

esPeligroso(Personaje) :-
	trabajaPara(Jefe, Personaje),
	realizaActividadPeligrosa(Jefe).

% San Cayetano/1:

sanCayetano(Personaje) :- 
	alguienCerca(Personaje, _),
	forall(alguienCerca(Personaje, Alguien), encargo(Personaje,Alguien,_)).

% nivelRespeto/2:

nivelRespeto(Personaje, Respeto) :-
	personaje(Personaje,_),
	respetoDe(Personaje, Respeto).

nivelRespeto(vincent, 15).

% respetabilidad:

respetabilidad(Respetables, NoRespetables) :-
	sonRespetables(Respetables),
	noSonRespetables(NoRespetables).

% masAtareado/1:

% masAtareado(Personaje) :-

% Predicados Auxiliares:

respetoDe(Personaje, Respeto) :-
	personaje(Personaje, actriz(Peliculas)),
	length(Peliculas, CantDePeliculas),
	Respeto is CantDePeliculas / 10.

respetoDe(Personaje, Respeto) :-
	personaje(Personaje, mafioso(resuelveProblemas)),
	Respeto is 10.

respetoDe(Personaje, Respeto) :-
	personaje(Personaje, mafioso(capo)),
	Respeto is 20.

alguienCerca(Personaje, Alguien) :- 
	amigo(Personaje, Alguien).

alguienCerca(Personaje, Alguien) :-
	trabajaPara(Alguien, Personaje).

alguienCerca(Personaje, Alguien) :-
	trabajaPara(Personaje, Alguien).

alguienCerca(Personaje, Alguien) :-
	amigo(Alguien, Personaje).

sonRespetables(Respetables):-
	findall(Personaje,tieneRespetoMayor(Personaje),ListaRespetables),
	length(ListaRespetables, CantRespetables),
	Respetables is CantRespetables.

noSonRespetables(NoRespetables) :-
	findall(Personaje,tieneRespetoMenor(Personaje),ListaNoRespetables),
	length(ListaNoRespetables, CantNoRespetables),
	NoRespetables is CantNoRespetables.

tieneRespetoMayor(Personaje) :-
	nivelRespeto(Personaje, Respeto),
	Respeto > 9.

tieneRespetoMenor(Personaje) :-
	nivelRespeto(Personaje,_),
	not(tieneRespetoMayor(Personaje)).

tieneRespetoMenor(Personaje) :-
	personaje(Personaje,_),
	not(nivelRespeto(Personaje,_)).

realizaActividadPeligrosa(Personaje) :-
	personaje(Personaje, mafioso(maton)).

realizaActividadPeligrosa(Personaje) :-
	personaje(Personaje, ladron(Lugares)),
	member(licorerias, Lugares).