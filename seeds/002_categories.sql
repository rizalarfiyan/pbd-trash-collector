INSERT INTO categories (category_id, name)
VALUES (1, 'Plastik'),
       (2, 'Kaleng'),
       (3, 'Kertas'),
       (4, 'Kaca'),
       (5, 'Logam'),
       (6, 'Organik'),
       (7, 'Elektronik');

INSERT INTO trashes (trash_id, name, point_per_weight)
VALUES (1, 'Botol Plastik', 5),
       (2, 'Tas Plastik', 3),
       (3, 'Kaleng Soda', 10),
       (4, 'Kaleng Makanan', 25),
       (5, 'Koran Bekas', 10),
       (6, 'Karton', 10),
       (7, 'Botol Kaca', 10),
       (8, 'Gelas Pecah', 7),
       (9, 'Paku', 60),
       (10, 'Kawat', 40),
       (11, 'Sisa Makanan', 2),
       (12, 'Daun Kering', 2),
       (13, 'Televisi Rusak', 200),
       (14, 'Handphone Bekas', 50);

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
