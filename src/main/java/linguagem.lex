%%

%class     LexicalAnalyzer
%unicode
%public
%type      NewToken
%function  yylex
%line
%column

BRANCO      = [ \t\r\n]+
ID          = [_a-zA-Z][_a-zA-Z0-9]*
INTEIRO     = 0 | [1-9][0-9]*
FLOAT       = {INTEIRO}"."{INTEIRO}
CHAR        = \'([^\'\\\n]|\\.)\'
STRING      = \"([^\"\\\n]|\\.)*\"

KW_INT      = "int"
KW_FLOAT    = "float"
KW_CHAR     = "char"
KW_STRING   = "string"
KW_VOID     = "void"

KW_IF       = "if"
KW_ELSE     = "else"
KW_WHILE    = "while"
KW_FOR      = "for"

INC_DEC     = "++" | "--"
COMP        = "==" | "!=" | "<=" | ">=" | "<" | ">"
ATRIB       = "="
ARIT        = "+" | "-" | "*" | "/" | "%"

LPAREN      = "\("
RPAREN      = "\)"
LBRACE      = "\{"
RBRACE      = "\}"
LBRACK      = "\["
RBRACK      = "\]"
SEMIC       = ";"
COMMA       = ","
DOT         = "\."

%%

{BRANCO}    { /* nada: joga fora */ }

"//".*         { /* ignora */ }

{KW_INT}      { return new NewToken("KW_INT",    yytext(), yyline+1, yycolumn+1); }
{KW_FLOAT}    { return new NewToken("KW_FLOAT",  yytext(), yyline+1, yycolumn+1); }
{KW_CHAR}     { return new NewToken("KW_CHAR",   yytext(), yyline+1, yycolumn+1); }
{KW_STRING}   { return new NewToken("KW_STRING", yytext(), yyline+1, yycolumn+1); }
{KW_VOID}     { return new NewToken("KW_VOID",   yytext(), yyline+1, yycolumn+1); }

{KW_INT}      { return new NewToken("KW_INT",    yytext(), yyline+1, yycolumn+1); }
{KW_FLOAT}    { return new NewToken("KW_FLOAT",  yytext(), yyline+1, yycolumn+1); }
{KW_CHAR}     { return new NewToken("KW_CHAR",   yytext(), yyline+1, yycolumn+1); }
{KW_STRING}   { return new NewToken("KW_STRING", yytext(), yyline+1, yycolumn+1); }
{KW_VOID}     { return new NewToken("KW_VOID",   yytext(), yyline+1, yycolumn+1); }

{KW_IF}       { return new NewToken("KW_IF",     yytext(), yyline+1, yycolumn+1); }
{KW_ELSE}     { return new NewToken("KW_ELSE",   yytext(), yyline+1, yycolumn+1); }
{KW_WHILE}    { return new NewToken("KW_WHILE",  yytext(), yyline+1, yycolumn+1); }
{KW_FOR}      { return new NewToken("KW_FOR",    yytext(), yyline+1, yycolumn+1); }

{FLOAT}       { return new NewToken("FLOAT_LIT", yytext(), yyline+1, yycolumn+1); }
{INTEIRO}     { return new NewToken("INT_LIT",   yytext(), yyline+1, yycolumn+1); }
{CHAR}        { return new NewToken("CHAR_LIT",  yytext(), yyline+1, yycolumn+1); }
{STRING}      { return new NewToken("STR_LIT",   yytext(), yyline+1, yycolumn+1); }

{INC_DEC}     { return new NewToken("INC_DEC",   yytext(), yyline+1, yycolumn+1); }
{COMP}        { return new NewToken("COMP_OP",   yytext(), yyline+1, yycolumn+1); }
{ATRIB}       { return new NewToken("ASSIGN",    yytext(), yyline+1, yycolumn+1); }
{ARIT}        { return new NewToken("ARITH_OP",  yytext(), yyline+1, yycolumn+1); }

{LPAREN}      { return new NewToken("LPAREN",    yytext(), yyline+1, yycolumn+1); }
{RPAREN}      { return new NewToken("RPAREN",    yytext(), yyline+1, yycolumn+1); }
{LBRACE}      { return new NewToken("LBRACE",    yytext(), yyline+1, yycolumn+1); }
{RBRACE}      { return new NewToken("RBRACE",    yytext(), yyline+1, yycolumn+1); }
{LBRACK}      { return new NewToken("LBRACK",    yytext(), yyline+1, yycolumn+1); }
{RBRACK}      { return new NewToken("RBRACK",    yytext(), yyline+1, yycolumn+1); }
{SEMIC}       { return new NewToken("SEMICOLON", yytext(), yyline+1, yycolumn+1); }
{COMMA}       { return new NewToken("COMMA",     yytext(), yyline+1, yycolumn+1); }
{DOT}         { return new NewToken("DOT",       yytext(), yyline+1, yycolumn+1); }

{ID}          { return new NewToken("IDENTIFIER",yytext(), yyline+1, yycolumn+1); }

[0-9]+            { return new NewToken("INT_LITERAL", yytext(), yyline+1, yycolumn+1); }

[a-zA-Z_][a-zA-Z0-9_]*
                  { return new NewToken("IDENTIFIER",  yytext(), yyline+1, yycolumn+1); }

<<EOF>>       { return null; }



. { throw new RuntimeException("Caractere inválido " + yytext()); }