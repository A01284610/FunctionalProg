% % comentario
% :- implicacion
% ; or
% , and
% . fin de linea
% Variable (en mayusculas)
% constante (en minusculas)

% facts: hechos. ada, lily y gus son gatos
cat(ada).
cat(lily).
cat(gus).
% query: cat(x)
% query: cat(lily)

% facts: hechos. fido, lara y octy son perros
dog(fido).
dog(lara).
dog(octy).
% query: dog(lily)

% facts: hechos. pancho, gala y kari son aves
bird(pancho).
bird(gala).
bird(kari).

% facts: hechos. octavio es pulpo
octopus(octavio).

% facts: genders de gatos
genderOf(ada, f).
genderOf(lily, f).
genderOf(gus, m).

% facts: raza de perros
raceOf(fido, chihuahua).
raceOf(lara, doberman).
raceOf(octy, pomerian).

% facts: especie de aves
raceOf(pancho, ninfa).
raceOf(gala, pavoreal).
raceOf(kari, canario).

% query: genderOf(X,f)
% query: genderOf(gus,X)
% query: genderOf(lily,m)

% reglas
sizeOf(X,big):- raceOf(X,doberman).
sizeOf(X,small):- raceOf(X,pomerian);raceOf(X,chihuahua).

pet(X) :- dog(X) ; bird(X) ; cat(X) ; octopus(X).

sings(X,nice):- raceOf(X,ninfa);raceOf(X,canario).

home(X,acuarium) :- octopus(X).

% Ana: gatos que sean f
likes(carlos, X) :- dog(X) , sizeOf(X, small).
likes(ana, X) :- cat(X) , genderOf(X, f).
likes(karla, X) :- (   bird(X),sings(X,nice)) ; home(X,acuarium).


% X puede tener mascotas que le gustan
canHave(X, Y) :- pet(Y) , likes(X, Y).