%option yylineno 
%option nounput

%{
 #include <string>
 #include <iostream>
 #include <vector>
 using namespace std ;
 #include "Auxiliar.hpp"
 #include "parser.hpp" 
 #include "PilaTablaSimbolos.hpp"
 #include "TablaSimbolos.hpp"

 #define TOKEN(t) yylval.str = new std::string(yytext, yyleng) ; return t 

 extern "C" int yywrap() { return(1) ; }  

%}

%%
programa										TOKEN(RPROGRAM) ;
procedimiento									TOKEN(TPROC);
variables										TOKEN(TVAR);

entero											TOKEN(TENTERO);
real											TOKEN(TREAL);

"+"												TOKEN(TSUM);
"-"												TOKEN(TRES);
"*"												TOKEN(TMUL);
"/"												TOKEN(TDIV);

"="												TOKEN(TASSIG);
">"												TOKEN(TMENOR);
"<"												TOKEN(TMAYOR);

"=="											TOKEN(TEQ);
">="											TOKEN(TGTH);
"<="											TOKEN(TLTH);
"/="											TOKEN(TNEQ);

not                                             TOKEN(TNOT);
or                                              TOKEN(TOR);
and                                             TOKEN(TAND);

":"												TOKEN(TDOSP);
";"												TOKEN(TSEMIC);
","												TOKEN(TCOMA);

"{"												TOKEN(TKOPEN);
"}"												TOKEN(TKCLOSE);

"("												TOKEN(TPOPEN);
")"												TOKEN(TPCLOSE);

array                                           TOKEN(TARRAY);
of                                              TOKEN(TOF);
"["                                             TOKEN(TCORCHA);
"]"                                             TOKEN(TCORCHC);

in												TOKEN(TIN);
out												TOKEN(TOUT);
"in out"										TOKEN(TINOUT);

si												TOKEN(TSI);
entonces										TOKEN(TENTONCES);
"repetir siempre"								TOKEN(TREPSIEMP);
repetir											TOKEN(TREPETIR);
hasta											TOKEN(THASTA);
"salir si"										TOKEN(TSALSI);

leer											TOKEN(TLEER);
escribir_linea									TOKEN(TESCRIBIR);

\/\/.+\n															;
\(\*+([^*]|\*+[^)*])*\*+\)							;

[ \t\n]											;

[a-zA-Z](\_?[a-zA-Z0-9])*						TOKEN(TIDENTIFIER);
[0-9]+\.[0-9]+([eE][\+\-]?[0-9]+)?				TOKEN(TDOUBLE);
[0-9]+ 											TOKEN(TINTEGER);

.												{ cout << "*Token desconocido en línea " << yylineno << endl;}
%%