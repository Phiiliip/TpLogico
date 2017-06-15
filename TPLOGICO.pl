%pareja(Persona, Persona)
pareja(marsellus, mia).
pareja(pumkin, honeyBunny).
pareja(bernardo, bianca).
pareja(bernardo, chiaro).

%trabajaPara(Empleador, Empleado)
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).

saleCon(Persona1, Persona2) :-
	pareja(Persona1, Persona2).


trabajaPara(Empleador, Empleado):-
	quienTrabaja(Empleado)

quienTrabaja(bernardo):-
	forall()

quienTrabaja(georga):-

esFiel(Persona):-
not(tieneMasDeUnaPareja(Persona)).

tieneMasDeUnaPareja(Persona):-
	pareja(Persona, Amor1),
	pareja(Persona, Amor2),
	Amor1 \= Amor2.

