# Ce fichier doit se nommer de préférence Makefile ou bien makefile
# car la commande `make', sans argument, cherche une description de
# projet dans un fichier nommé `makefile' ou `Makefile' (dans cet
# ordre).

# La commande `make' cherchera à mettre à jour la première cible du
# makefile (ici, compte).

compte:  cptlex.cmo compte.cmo
	ocamlc -o compte cptlex.cmo compte.cmo 

# Pour compiler compte.ml, on doit disposer de l'interface compilée cptlex.cmi
# qui est produite en même temps que cptlex.cmo. C'est en effet cptlex.cmi qui
# est consultée par le compilateur OCaml pour savoir quel est le type de
# Cptlex.count, utilisée par compte.ml
# le fichier compte.cmo dépend donc de cptlex.cmo
compte.cmo: compte.ml cptlex.cmo
	ocamlc -c compte.ml

cptlex.cmo: cptlex.ml
	ocamlc -c cptlex.ml

cptlex.ml: cptlex.mll
	ocamllex cptlex.mll

# Il peut exister de fausses cibles (comme `clean' ci-dessous).

clean:
	/bin/rm -f *.cmo *.cmi cptlex.ml

