## MLD

- élevage (codeÉlevage, nom, adresse)
- robe (codeRobe, description)
- genre (sex)
- race (codeRace, nom, espèce)
- animal (codeAnimal, nom, pseudonyme, anniversaire, #codeRobe, #codeGenre, #codeRace, #codeÉlevage)
- parent (codeParent, lien_familial, #codeAncêtre, #codeAnimal)
- mesure (codeMesure, date, poids, taille, #codeAnimal)
- photo (codePhoto, fichier, description, #codeAnimal)


## MPD

- breeder : id(INT), name(TEXT), address(TEXT)
- color : id(SMALLINT), description(TEXT)
- gender : sex(SEX)
- race : id(INT), nom(TEXT), species(TEXT)
- pet : id(INT), name(TEXT), nickname(TEXT), birthday(DATE), #color_id(SMALLINT), #gender_sex(SEX), #race_id(INT), #breeder_id(INT)
- parent : id(INT), tie(TEXT), #ancestor_id(INT), #pet_id(INT)
- metering : id(INT), date(TIMESTAMPTZ), weight(SMALLINT), size(SMALLINT), #pet_id(INT)
- picture : id(INT), file(TEXT), description(TEXT), #pet_id(INT)
