%{
    #include "DAP.hpp"
%}

%defines

%token CR

%%
DAP: | DAP ex

ex: CR  { fprintf(stderr,"\n"); }
