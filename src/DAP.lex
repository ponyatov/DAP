%{
    #include "DAP.hpp"
    char *yyfile = nullptr;
%}

%option noyywrap yylineno

%%
\r\n        { return CR; }
