PREFIX = /usr/local
FOLDER = note.sh
BIN = note

.PHONY: install
install:
	mkdir $(PREFIX)/$(FOLDER)
	cp note.sh $(PREFIX)/$(FOLDER)/$(BIN)
	cp .help $(PREFIX)/$(FOLDER)/.help
	cp .edit $(PREFIX)/$(FOLDER)/.edit
	cp .link $(PREFIX)/$(FOLDER)/.link
	cp .list $(PREFIX)/$(FOLDER)/.list
	cp .search $(PREFIX)/$(FOLDER)/.search
	cp .tag $(PREFIX)/$(FOLDER)/.tag
	cp Makefile $(PREFIX)/$(FOLDER)/Makefile
	cp LICENSE $(PREFIX)/$(FOLDER)/LICENSE
	ln -s $(PREFIX)/$(FOLDER)/$(BIN) $(PREFIX)/bin/$(BIN)

.PHONY: uninstall
uninstall:
	rm -rf $(PREFIX)/$(FOLDER)
	rm $(PREFIX)/bin/$(BIN)
