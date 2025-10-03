package analizador;

import java_cup.runtime.Symbol;

%%

%class Lexer
%unicode
%cup
%line
%column
%public 

%eof{
    return new Symbol(sym.EOF);
%eof}

// Definiciones
ALPHA = [a-zA-Z]
DIGIT = [0-9]
ID = {ALPHA}({ALPHA}|{DIGIT}|_)*
NUM = -?{DIGIT}+(\.{DIGIT}+)?
STRING = \"([^\"\n\"]*)\"
IGNORED = [ \t\r\n]+
ERROR_CHAR = [^]


%%

// --- Palabras Reservadas Mágicas ---
"Bestia"        { return new Symbol(sym.BESTIA, yyline, yycolumn, yytext()); }
"Lumus"         { return new Symbol(sym.LUMUS, yyline, yycolumn, yytext()); }
"Accio"         { return new Symbol(sym.ACCIO, yyline, yycolumn, yytext()); }
"Crucio"        { return new Symbol(sym.CRUCIO, yyline, yycolumn, yytext()); }
"Confundo"      { return new Symbol(sym.CONFUNDO, yyline, yycolumn, yytext()); }
"Imperio"       { return new Symbol(sym.IMPERIO, yyline, yycolumn, yytext()); }
"Avada"         { return new Symbol(sym.AVADA, yyline, yycolumn, yytext()); }
"Kedavra"       { return new Symbol(sym.KEDAVRA, yyline, yycolumn, yytext()); }
"Wingardium"    { return new Symbol(sym.WINGARDIUM, yyline, yycolumn, yytext()); }
"AccioDivisio"  { return new Symbol(sym.ACCIODIVISIO, yyline, yycolumn, yytext()); }
"Sectumsempra"  { return new Symbol(sym.SECTUMSEMPRA, yyline, yycolumn, yytext()); }
"Protego"       { return new Symbol(sym.PROTEGO, yyline, yycolumn, yytext()); }
"Expeliarmus"   { return new Symbol(sym.EXPELIARMUS, yyline, yycolumn, yytext()); }
"Obliviate"     { return new Symbol(sym.OBLIVIATE, yyline, yycolumn, yytext()); }
"Rictusempra"   { return new Symbol(sym.RICTUSEMPRA, yyline, yycolumn, yytext()); }
"Expulso"       { return new Symbol(sym.EXPULSO, yyline, yycolumn, yytext()); }
"Portus"        { return new Symbol(sym.PORTUS, yyline, yycolumn, yytext()); }

// --- Palabras de Control y Operadores Compuestos ---
"hasta"         { return new Symbol(sym.HASTA, yyline, yycolumn, yytext()); }
"in"            { return new Symbol(sym.IN, yyline, yycolumn, yytext()); }
"=="            { return new Symbol(sym.IGUAL, yyline, yycolumn, yytext()); }
"!="            { return new Symbol(sym.DIFERENTE, yyline, yycolumn, yytext()); }
"++"            { return new Symbol(sym.PLUSPLUS, yyline, yycolumn, yytext()); }
"--"            { return new Symbol(sym.MINUSMINUS, yyline, yycolumn, yytext()); }

// --- Delimitadores y Símbolos Simples (Usando los nombres de Parser.cup) ---
">"             { return new Symbol(sym.MAYOR, yyline, yycolumn, yytext()); }
"<"             { return new Symbol(sym.MENOR, yyline, yycolumn, yytext()); }
"{"             { return new Symbol(sym.LLAVEIZQ, yyline, yycolumn, yytext()); }
"}"             { return new Symbol(sym.LLAVEDER, yyline, yycolumn, yytext()); }
"("             { return new Symbol(sym.PARENIZQ, yyline, yycolumn, yytext()); }
")"             { return new Symbol(sym.PARENDER, yyline, yycolumn, yytext()); }
","             { return new Symbol(sym.COMA, yyline, yycolumn, yytext()); }
";"             { return new Symbol(sym.PUNTOCOMA, yyline, yycolumn, yytext()); }
":"             { return new Symbol(sym.DOSPUNTOS, yyline, yycolumn, yytext()); }
"#"             { return new Symbol(sym.HASH, yyline, yycolumn, yytext()); }
"="             { return new Symbol(sym.ASIGN, yyline, yycolumn, yytext()); }
"+"             { return new Symbol(sym.MAS, yyline, yycolumn, yytext()); }
"-"             { return new Symbol(sym.MENOS, yyline, yycolumn, yytext()); }
"*"             { return new Symbol(sym.POR, yyline, yycolumn, yytext()); }
"/"             { return new Symbol(sym.DIV, yyline, yycolumn, yytext()); }

// --- Identificadores y Constantes ---
{ID}            { return new Symbol(sym.ID, yyline, yycolumn, yytext()); }
{NUM}           { return new Symbol(sym.NUM, yyline, yycolumn, yytext()); }
{STRING}        { return new Symbol(sym.CADENA, yyline, yycolumn, yytext()); }

// --- Ignorar Espacios ---
{IGNORED}       { /* Ignorar */ }

// --- Errores Léxicos ---
{ERROR_CHAR}    { 
    return new Symbol(sym.ERROR_LEXICO, yyline, yycolumn, yytext());
} 

// Métodos estáticos de reporte para Principal.java
// (Debe incluirse en Lexer.java para que Principal pueda llamar a estos métodos)
public static String getTipoToken(int tokenID) {
    // ... (Implementación del switch) ...
    return "DESCRIPCIÓN DE TOKEN";
}
public static String getSimbolo(int tokenID) {
    // ... (Implementación del switch) ...
    return "SÍMBOLO";
}   