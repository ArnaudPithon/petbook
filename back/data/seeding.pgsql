SET ROLE petbook;

BEGIN;

    -- éleveurs

    INSERT INTO
    breeder ("name", "adress")
    VALUES
    ( 'unknown', null ),
    (
        'la Légende du Loup Noir',
        'chemin de la Goutte des Forges F - 90200 Lepuix'
    );

    -- robes

    INSERT INTO
    color ("description")
    VALUES
    ('unknown'),
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
        "name", "nickname", "birthday", "sex",
        "color_id", "race_id", "breeder_id"
    )
    values
    (
        'Usul', null, '2023-04-08', '2',
        (SELECT id FROM "color"
            WHERE "description" = 'noir'),
        (SELECT id FROM "race"
            WHERE "name" = 'Aldeutscher Schäferhund'),
        (SELECT id FROM "breeder"
            WHERE "name" = 'la Légende du Loup Noir')
    ),
    (
        'Umber', null, '2023-01-26', '2',
        (SELECT id FROM "color"
            WHERE "description" = 'Bleu tabby ticked et blanc'),
        (SELECT id FROM "race"
            WHERE "name" = 'Main Coon'),
        (SELECT id FROM "breeder"
            WHERE "name" = 'unknown')
    ),
    (
        'Sir Archi', 'Archi', '2021-03-19', '1',
        (SELECT id FROM "color"
            WHERE "description" = 'blanc'),
        (SELECT id FROM "race"
            WHERE "name" = 'Westie'),
        (SELECT id FROM "breeder"
            WHERE "name" = 'unknown')
    ),
    (
        'Napolitain', 'Leo', '2017-03-14', '1',
        (SELECT id FROM "color"
            WHERE "description" = 'Golden seal point'),
        (SELECT id FROM "race"
            WHERE "name" = 'British Short Hair'),
        (SELECT id FROM "breeder"
            WHERE "name" = 'unknown')
    );

    -- other pets

    INSERT INTO
    pet
    (
        "name", "birthday",
        "color_id", "sex", "race_id", "breeder_id"
    )
    values
    (
        'Northface', '2017-05-10',
        (SELECT id FROM "color"
            WHERE "description" = 'gris argenté charbonné, poil long'),
        '1',
        (SELECT id FROM "race"
            WHERE "name" = 'Aldeutscher Schäferhund'),
        (SELECT id FROM "breeder"
            WHERE "name" = 'la Légende du Loup Noir')
    ),
    (
        'Peeta', '2019-02-09',
        (SELECT id FROM "color"
            WHERE "description" = 'noir et feu, poil long'),
        '2',
        (SELECT id FROM "race"
            WHERE "name" = 'Aldeutscher Schäferhund'),
        (SELECT id FROM "breeder"
            WHERE "name" = 'la Légende du Loup Noir')
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
