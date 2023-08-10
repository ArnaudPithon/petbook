SET ROLE petbook;

BEGIN;

    -- éleveurs

    INSERT INTO
    breeder ("name", "adress")
    VALUES
    (
        'la Légende du Loup Noir',
        'chemin de la Goutte des Forges F - 90200 Lepuix'
    );

    -- robes

    INSERT INTO
    color ("description")
    VALUES
    ('noir'),
    ('blanc'),
    ('Bleu tabby ticked et blanc'),
    ('Golden seal point'),
    ('gris argenté charbonné, poil long'),
    ('noir et feu, poil long'),
    ('sable (argenté charbonné), poil long'),
    ('sable charbonné, poil long'),
    ('noir et argenté, poil long'),
    ('gris/sable charbonné, poil long') ;

    -- races

    INSERT INTO
    race ("name", "species")
    VALUES
    ('inconnue', 'chien'),
    ('inconnue', 'chat'),
    ('Aldeutscher Schäferhund', 'chien'),
    ('Westie', 'chien'),
    ('British Short Hair', 'chat'),
    ('Main Coon', 'chat');

    -- mine pets

    INSERT INTO
    pet
    (
        "name", "birthday",
        "color_id", "sex", "race_id", "breeder_id"
    )
    values
    (
        'Usul', '2023-04-08',
        (SELECT id FROM "color"
            WHERE "description" = 'noir'),
        '2',
        (SELECT id FROM "race"
            WHERE "name" = 'Aldeutscher Schäferhund'),
        (SELECT id FROM "breeder"
            WHERE "name" = 'la Légende du Loup Noir')
    );
    INSERT INTO
    pet
    (
        "name", "nickname", "birthday",
        "color_id", "sex", "race_id", "breeder_id"
    )
    values
    (
        'Sir Archi', 'Archi', '2021-03-19',
        (SELECT id FROM "color"
            WHERE "description" = 'blanc'),
        '1',
        (SELECT id FROM "race"
            WHERE "name" = 'Westie'),
        null
    ),
    (
        'Napolitain', 'Leo', '2017-03-14',
        (SELECT id FROM "color"
            WHERE "description" = 'Golden seal point'),
        '1',
        (SELECT id FROM "race"
            WHERE "name" = 'British Short Hair'),
        null
    );
    INSERT INTO
    pet
    (
        "name", "birthday",
        "color_id", "sex", "race_id", "breeder_id"
    )
    values
    (
        'Umber', '2023-01-26',
        (SELECT id FROM "color"
            WHERE "description" = 'Bleu tabby ticked et blanc'),
        '2',
        (SELECT id FROM "race"
            WHERE "name" = 'Main Coon'),
        null
    );

    -- other pets

    INSERT INTO
    pet
    (
        "name", "birthday",
        "color_id", "sex", "race_id"
    )
    values
    (
        'Northface', '2017-05-10',
        (SELECT id FROM "color"
            WHERE "description" = 'gris argenté charbonné, poil long'),
        '1',
        (SELECT id FROM "race"
            WHERE "name" = 'Aldeutscher Schäferhund')
    ),
    (
        'Peeta', '2019-02-09',
        (SELECT id FROM "color"
            WHERE "description" = 'noir et feu, poil long'),
        '2',
        (SELECT id FROM "race"
            WHERE "name" = 'Aldeutscher Schäferhund')
    );

    -- parentés

    INSERT INTO
    parent ( "tie", "ancestor_id", "pet_id" )
    VALUES
    (
        '1',
        (SELECT id FROM "pet"
            WHERE "name" = 'Northface'),
        (SELECT id FROM "pet"
            WHERE "name" = 'Usul')
    ),
    (
        '2',
        (SELECT id FROM "pet"
            WHERE "name" = 'Peeta'),
        (SELECT id FROM "pet"
            WHERE "name" = 'Usul')
    );

    -- tailes, poids

    INSERT INTO
    metering ( "date", "weight", "size", "pet_id" )
    VALUES
    ( '2023-06-28', '10.2', null,
        (SELECT id FROM "pet" WHERE "name" = 'Usul')
    ),
    ( '2023-07-29', '16', null,
        (SELECT id FROM "pet" WHERE "name" = 'Usul')
    ),
    ( '2023-04-08', '45', '67',
        (SELECT id FROM "pet" WHERE "name" = 'Northface')
    ),
    ( '2023-04-08', '32', '59',
        (SELECT id FROM "pet" WHERE "name" = 'Peeta')
    );

    COMMIT;

RESET ROLE;
