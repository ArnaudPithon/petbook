SET ROLE petbook;

BEGIN;

    INSERT INTO
    breeder ("name", "adress")
    VALUES
    (
        'la Légende du Loup Noir',
        'chemin de la Goutte des Forges F - 90200 Lepuix'
    );

    INSERT INTO
    color ("description")
    VALUES
    ('noir');

    INSERT INTO
    gender ("sex")
    VALUES
    ('0'), ('1'), ('2');

    INSERT INTO
    race ("description", "species")
    VALUES
    ("inconnue", "chien"),
    ("inconnue", "chat"),
    ("Aldeutscher Schäferhund", "chien"),
    ("Westie", "chien"),
    ("British Short Hair", "chat"),
    ("Main Coon", "chat");

    INSERT INTO
    animal
    (
        "name", "birthday",
        "color_id", "gender_sex", "race_id", "breeder_id"
    )
    values
    (
        "Usul", "2023-04-08",
        (SELECT id FROM "color"
            WHERE "description" = 'noir'),
        '2',
        (SELECT id FROM "race"
            WHERE "description" = 'Aldeutscher Schäferhund'),
        (SELECT id FROM "breeder"
            WHERE "name" = 'la Légende du Loup Noir')
    );
    INSERT INTO
    animal
    (
        "name", "pseudo", "birthday",
        "color_id", "gender_sex", "race_id", "breeder_id"
    )
    values
    (
        "Sir Archi", "Archi", "2021",
        null,
        '1',
        (SELECT id FROM "race"
            WHERE "description" = 'Westie'),
        null
    ),
    (
        "Napolitain", "Leo", "2019",
        null,
        '1',
        (SELECT id FROM "race"
            WHERE "description" = 'British Short Hair'),
        null
    );
    INSERT INTO
    animal
    (
        "name", "birthday",
        "color_id", "gender_sex", "race_id", "breeder_id"
    )
    values
    (
        'Umber', "2023",
        null,
        '2',
        (SELECT id FROM "race"
            WHERE "description" = 'Main Coon'),
        null
    );

    COMMIT;

RESET ROLE;
