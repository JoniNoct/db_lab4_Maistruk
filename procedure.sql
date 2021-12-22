CREATE OR REPLACE PROCEDURE cars_by_engine(eng_id integer)
LANGUAGE plpgsql AS
$$
  DECLARE
    temp_rec record;
  BEGIN
    FOR temp_rec IN
      SELECT cars.model
      FROM cars
      WHERE cars.engine_id = eng_id
    LOOP
      RAISE INFO 'Model by engine: %', temp_rec.model;
    END LOOP;
  END;
$$