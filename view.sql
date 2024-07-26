DROP VIEW if EXISTS v_regency_3403;
CREATE VIEW v_regency_3403 AS
SELECT user_id, province_id, regency_id, district_id, village_id, address, city_born, born_date, gender FROM user_details
WHERE regency_id = '3403';

DROP VIEW if EXISTS v_wilayah;
CREATE VIEW v_wilayah AS
SELECT p.province_id, r.regency_id, d.district_id, v.village_id, p.name AS province, r.name AS regency, d.name AS district, v.name AS village
FROM provinces p JOIN regencies r USING (province_id) JOIN districts d USING (regency_id) JOIN villages v USING (district_id);

DROP VIEW if EXISTS v_approved_carts;
CREATE VIEW v_approved_carts AS
SELECT * FROM carts WHERE status = 'approved';

DROP VIEW if EXISTS v_heavy_approved_carts;
CREATE VIEW v_heavy_approved_carts AS SELECT * FROM v_approved_carts WHERE total_weight > 10 WITH CASCADED CHECK OPTION;
