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