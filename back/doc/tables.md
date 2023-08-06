## MLD

- animal (codeAnimal, nom, anniversaire, taille, poids, chip, zb, #codeRobe, #codeGenre, #codeRace, #codeÉlevage)
- élevage (codeÉlevage, nom, adresse)
- robe (codeRobe, description)
- genre (codeGenre, description)
- race (codeRace, nom, espèce)
- ancêtre (codeAncêtre, #codeAnimal)
- parent (codeParent, lien, #codeAncêtre, #codeAnimal)


## MPD

- animal : id(INT), name(TEXT), birthday(DATE), size(INT), weight(INT), #color_id(INT), #gender_id(INT), #race_id(INT), #breeder_id(INT)
- breeder : id(INT), name(TEXT), adress(TEXT)
- color : id(INT), description(TEXT)
- gender : id(INT), description(TEXT)
- race : id(INT), description(TEXT)
- ancestor : id(INT), #animal_id(INT)
- parent : id(INT), tie(TEXT), #ancestor_id(INT), #animal_id(INT)
