# src
C += $(wildcard $(SRC)/*.c*)
H += $(wildcard $(INC)/*.h*)
F += $(wildcard $(LIB)/*.ini) $(wildcard $(LIB)/*.f)

CP += $(TMP)/$(MODULE).parser.cpp $(TMP)/$(MODULE).lexer.cpp
HP += $(TMP)/$(MODULE).parser.hpp

OBJ = $(patsubst $(SRC)/%.c*,$(TMP)/%.o,$(C) $(CP))
