CC=ocamlopt
BIN=dico

SRC=dico.ml

$(BIN): $(SRC)
	$(CC) -o $@ $^

clean:
	rm -rf *.cm{i,x} *.o

cleanall: clean
	rm -rf $(BIN)
