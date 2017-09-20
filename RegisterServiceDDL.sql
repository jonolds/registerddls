CREATE EXTENSION "uuid-ossp";

/*this is createing the table -Ross */
CREATE TABLE employee (
  record_id uuid NOT NULL,
  first_name char(10),
  last_name char(15),
  employee_id int,
  active Char(2), CHECK ((active='Y') OR (active='N')),


  password char(25),
  createdon timestamp without time zone NOT NULL DEFAULT now(),
);

/*Inserting a test record -Ross*/
INSERT INTO employee VALUES (
       uuid_generate_v4()
     , 'Test'
     , 'ing'
     , 10
     , 'Y'
     , 'fall2017'
     , current_timestamp
);

