%pareja(Persona, Persona)
pareja(marsellus, mia).
pareja(pumkin, honeyBunny).
pareja(bernardo, bianca).
pareja(bernardo, chiaro).

%trabajaPara(Empleador, Empleado)
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

