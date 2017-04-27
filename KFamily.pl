%Inteligencia Artificial
%Ejercicio 4: Familia Real en Prolog
%Escrito por: Bryan Fernando Ortiz

%Listado de Sexo de los hombres
hombre('Juan').
hombre('Juan Carlos I').
hombre('Carlos Zurita').
hombre('Alfonso').
hombre('Jaime').
hombre('Inaki').
hombre('Felipe VI').
hombre('Alfonso Zurita').
hombre('Felipe').
hombre('Juan Urdangarin').
hombre('Pablo').
hombre('Miguel').

mujer('Maria Mercedes').
mujer('Pilar').
mujer('Sofia').
mujer('Margarita').
mujer('Elena').
mujer('Cristina').
mujer('Letizia').
mujer('Maria Zurita').
mujer('Victoria').
mujer('Irene').
mujer('Leonor').
mujer('Sofia 2007').

madre('Pilar','Maria Mercedes').
madre('Juan Carlos I','Maria Mercedes').
madre('Margarita','Maria Mercedes').
madre('Alfonso','Maria Mercedes').
madre('Elena','Sofia').
madre('Cristina','Sofia').
madre('Felipe VI','Sofia').
madre('Alfonso Zurita','Margarita').
madre('Maria Zurita','Margarita').
madre('Felipe','Elena').
madre('Victoria','Elena').
madre('Juan Urdangarin','Cristina').
madre('Pablo','Cristina').
madre('Miguel','Cristina').
madre('Irene','Cristina').
madre('Leonor','Letizia').
madre('Sofia 2007','Letizia').

padre('Pilar','Juan').
padre('Juan Carlos I','Juan').
padre('Margarita','Juan').
padre('Alfonso','Juan').
padre('Elena','Juan Carlos I').
padre('Cristina','Juan Carlos I').
padre('Felipe VI','Juan Carlos I').
padre('Alfonso Zurita','Carlos Zurita').
padre('Maria Zurita','Carlos Zurita').
padre('Felipe','Jaime').
padre('Victoria','Jaime').
padre('Juan Urdangarin','Inaki').
padre('Pablo','Inaki').
padre('Miguel','Inaki').
padre('Irene','Inaki').
padre('Leonor','Felipe VI').
padre('Sofia 2007','Felipe VI').

pareja('Maria Mercedes','Juan').
pareja('Sofia','Juan Carlos I').
pareja('Margarita','Carlos Zurita').
pareja('Elena','Jaime').
pareja('Cristina','Inaki').
pareja('Letizia','Felipe VI').

esposo(Y,X):-   pareja(Y,X),hombre(X).
esposa(X,Y):-   pareja(Y,X),mujer(Y).
hijo(Z,Y,X):-   padre(Z,Y),hombre(Z),madre(Z,X).
hija(Z,Y,X):-   padre(Z,Y),mujer(Z),madre(Z,X).
abuelo(X,Y):-   padre(X,Z),padre(Z,Y);
                madre(X,Z),padre(Z,Y).
abuela(X,Y):-   padre(X,Z),madre(Z,Y);
                madre(X,Z),madre(Z,Y).
hermano(X,Y):-  pareja(A,B), padre(X,B),madre(Y,A), hombre(Y), Y\=X.
hermana(X,Y):-  pareja(A,B), padre(X,B),madre(Y,A), mujer(Y), Y\=X.
tio(X,Y):-      pareja(A,Y),hermana(B,A),padre(X,B);
                pareja(A,Y),hermana(B,A),madre(X,B);
                hermana(Y,A),madre(X,A), hombre(Y);
                hermano(Y,A),padre(X,A), hombre(Y).
tia(X,Y):-      pareja(A,Y),hermana(B,A),padre(X,B);
                pareja(A,Y),hermana(B,A),madre(X,B);
                hermana(Y,A),madre(X,A), mujer(Y);
                hermano(Y,A),padre(X,A), mujer(Y).
primo(X,Y):-    hombre(Y),padre(Y,A),hermano(B,A),padre(X,B);
                hombre(Y),padre(Y,A),hermano(B,A),madre(X,B);
                hombre(Y),madre(Y,A),hermana(B,A),padre(X,B);
                hombre(Y),madre(Y,A),hermana(B,A),madre(X,B).
prima(X,Y):-    mujer(Y),padre(Y,A),hermano(B,A),padre(X,B);
                mujer(Y),padre(Y,A),hermano(B,A),madre(X,B);
                mujer(Y),madre(Y,A),hermana(B,A),padre(X,B);
                mujer(Y),madre(Y,A),hermana(B,A),madre(X,B).