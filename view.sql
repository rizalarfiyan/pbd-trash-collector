drop view if exists v_regency_3403;
create view v_regency_3403 as select user_id, province_id, regency_id, district_id, village_id, address, city_born, born_date, gender from user_details where regency_id = '3403';

drop view if exists v_wilayah;
create view v_wilayah as
    SELECT p.province_id, r.regency_id, d.district_id, v.village_id, p.name AS province, r.name AS regency, d.name AS district, v.name AS village
    FROM provinces p JOIN regencies r USING (province_id) JOIN districts d USING (regency_id) JOIN villages v USING (district_id);

drop view if exists v_approved_carts;
create view v_approved_carts as select * from carts where status = 'approved';

drop view if exists v_heavy_approved_carts;
create view v_heavy_approved_carts as select * from v_approved_carts where total_weight > 10 with cascaded check option;