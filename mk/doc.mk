# doc
LOGO = vscode/$(MODULE).png
.PHONY: doxy
doxy: .doxygen doc/DoxygenLayout.xml $(LOGO)
	rm -rf doc/html ; doxygen $< 1>/dev/null

.PHONY: doc
doc: $(DOCS)
