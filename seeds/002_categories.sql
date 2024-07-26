INSERT INTO categories (category_id, name)
VALUES (1, 'Plastik'),
       (2, 'Kaleng'),
       (3, 'Kertas'),
       (4, 'Kaca'),
       (5, 'Logam'),
       (6, 'Organik'),
       (7, 'Elektronik');

INSERT INTO trashes (trash_id, name)
VALUES (1, 'Botol Plastik'),
       (2, 'Tas Plastik'),
       (3, 'Kaleng Soda'),
       (4, 'Kaleng Makanan'),
       (5, 'Koran Bekas'),
       (6, 'Karton'),
       (7, 'Botol Kaca'),
       (8, 'Gelas Pecah'),
       (9, 'Paku'),
       (10, 'Kawat'),
       (11, 'Sisa Makanan'),
       (12, 'Daun Kering'),
       (13, 'Televisi Rusak'),
       (14, 'Handphone Bekas');

INSERT INTO category_trash (category_id, trash_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (3, 5),
       (3, 6),
       (4, 7),
       (4, 8),
       (5, 9),
       (5, 10),
       (6, 11),
       (6, 12),
       (7, 13),
       (7, 14);
