# rule

bin/$(MODULE): $(OBJ)
	$(CXX) $(XFLAGS) -o $@ $^

$(TMP)/%.o: $(SRC)/%.c $(H)
	$(CXX) $(XFLAGS) -o $@ -c $<

$(TMP)/%.lexer.cpp: $(SRC)/%.lex
	flex -o $@ $<

$(TMP)/%.parser.cpp: $(SRC)/%.yacc
	bison -o $@ $<
