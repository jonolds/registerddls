CREATE EXTENSION "uuid-ossp";

/*this is createing the table -Ross */
CREATE TABLE employee (
  record_id uuid NOT NULL primary key,
  first_name char(10),
  last_name char(15),
  employee_id int,
  active Char(2), CHECK ((active='Y') OR (active='N')),
  classificatoin Char(20), CHECK ((classification='General Manager') OR (classification='Shift Manager') OR (classification='Cashier')),
  manager uuid, Foreign key (employee) References employee (record_id),
  password char(25),
  createdon timestamp without time zone NOT NULL DEFAULT now()
);

/*Inserting a test record -Ross*/
INSERT INTO employee VALUES (
       uuid_generate_v4()
     , 'Test'
     , 'ing'
     , 10
     , 'Y'
     , 'General Manager'
     , null
     , 'fall2017'
     , current_timestamp
);

