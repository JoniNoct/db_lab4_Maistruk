-- procedure

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

CALL cars_by_engine(902)

-- function

CREATE OR REPLACE FUNCTION cars_counter(eng_id integer) RETURNS int AS
$$
  DECLARE
    result_ integer;
  BEGIN
    SELECT COUNT(*) INTO result_
    FROM cars
      WHERE cars.engine_id = eng_id;
    
    RETURN result_;
  END;
$$ LANGUAGE 'plpgsql';

SELECT * FROM cars_counter(902)

-- trigger

-------------------------