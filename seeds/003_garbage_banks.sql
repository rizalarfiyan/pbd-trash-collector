INSERT INTO garbage_banks (garbage_bank_id, province_id, regency_id, district_id, village_id, address)
VALUES (1, '34', '3401', '340103', '3401032007', 'Jl. Melati Gang II No. 5'),
       (2, '34', '3403', '340314', '3403142006', 'Jl. Kenanga Raya No. 12'),
       (3, '34', '3471', '347111', '3471111001', 'Jl. Flamboyan Indah No. 8'),
       (4, '34', '3403', '340312', '3403122001', 'Jl. Anggrek IV No. 27'),
       (5, '34', '3471', '347112', '3471121001', 'Jl. Dahlia Asri No. 3'),
       (6, '34', '3471', '347101', '3471011004', 'Jl. Teratai VI No. 19'),
       (7, '34', '3402', '340201', '3402012001', 'Jl. Mawar Mutiara No. 15'),
       (8, '34', '3403', '340315', '3403152007', 'Jl. Cemara II No. 22'),
       (9, '34', '3403', '340314', '3403142007', 'Jl. Bougenville No. 7'),
       (10, '34', '3401', '340106', '3401062003', 'Jl. Kamboja No. 30');

INSERT INTO operation_hours (garbage_bank_id, day, open, close)
VALUES (1, 'monday', '08:00:00', '17:00:00'),
       (1, 'wednesday', '08:00:00', '17:00:00'),
       (1, 'friday', '08:00:00', '17:00:00'),
       (2, 'tuesday', '09:00:00', '16:00:00'),
       (2, 'thursday', '09:00:00', '16:00:00'),
       (2, 'saturday', '09:00:00', '14:00:00'),
       (3, 'monday', '07:00:00', '18:00:00'),
       (3, 'thursday', '07:00:00', '18:00:00'),
       (4, 'tuesday', '08:30:00', '17:30:00'),
       (4, 'wednesday', '08:30:00', '17:30:00'),
       (4, 'friday', '08:30:00', '17:30:00'),
       (4, 'saturday', '08:30:00', '15:00:00'),
       (5, 'monday', '08:00:00', '16:00:00'),
       (5, 'tuesday', '08:00:00', '16:00:00'),
       (5, 'thursday', '08:00:00', '16:00:00'),
       (5, 'friday', '08:00:00', '16:00:00'),
       (6, 'wednesday', '09:00:00', '18:00:00'),
       (6, 'thursday', '09:00:00', '18:00:00'),
       (6, 'saturday', '09:00:00', '13:00:00'),
       (7, 'monday', '08:00:00', '17:00:00'),
       (7, 'tuesday', '08:00:00', '17:00:00'),
       (7, 'thursday', '08:00:00', '17:00:00'),
       (7, 'friday', '08:00:00', '17:00:00'),
       (8, 'tuesday', '08:00:00', '16:00:00'),
       (8, 'wednesday', '08:00:00', '16:00:00'),
       (8, 'friday', '08:00:00', '16:00:00'),
       (8, 'saturday', '08:00:00', '14:00:00'),
       (9, 'monday', '09:00:00', '18:00:00'),
       (9, 'wednesday', '09:00:00', '18:00:00'),
       (9, 'friday', '09:00:00', '18:00:00'),
       (10, 'tuesday', '07:00:00', '17:00:00'),
       (10, 'thursday', '07:00:00', '17:00:00'),
       (10, 'saturday', '07:00:00', '14:00:00');
