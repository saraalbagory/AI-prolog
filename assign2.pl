:- dynamic (state/3).
/*state(color,col,row) */

%predicate to create the board:- J>=ColJ>=Col
%createState(_, _, _, [], []).
createState(Col,Col,Row,Colors,Colors).
createState(J,Col,Row,[Color|Colors],NewList):- J<Col, assertz(state(Color, J, Row)),Jt is J + 1,!,createState(Jt,Col,Row,Colors,Colors).


%createRow(_,_,_,[]). 
createRow(I,_,Row,Colors) :-I>=Row.
createRow(I,Col,Row,Colors):-I<Row,
   % J is 0,
    createState(0,Col,I,Colors,NewList),
    NewI is I+1,
    createRow(NewI,Col,Row,Colors).

/*create a N^M board with the Board list which is a list of colors b: blue, r for red , y for yellow*/

findCycle(N,M,Board):-createRow(0,N,M,Board).
%findCycle(4,4,[y,y,y,r,b,y,b,y,b,b,b,y,b,b,b,y]).

% collectStates(States)
% Returns a list of all states that have been created
collectStates(States) :-
    findall(state(Color, Col, Row), state(Color, Col, Row), States).
