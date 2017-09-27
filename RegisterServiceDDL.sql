CREATE EXTENSION "uuid-ossp";

CREATE TABLE product (
  id uuid NOT NULL,
  lookupcode character varying(32) NOT NULL DEFAULT(''),
  count int NOT NULL DEFAULT(0),
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT product_pkey PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE INDEX ix_product_lookupcode
  ON product
  USING btree
  (lower(lookupcode::text) COLLATE pg_catalog."default");

INSERT INTO product VALUES (
       uuid_generate_v4()
     , 'lookupcode1'
     , 100
     , current_timestamp
);

INSERT INTO product VALUES (
       uuid_generate_v4()
     , 'lookupcode1'
     , 125
     , current_timestamp
);

INSERT INTO product VALUES (
       uuid_generate_v4()
     , 'lookupcode3'
     , 150
     , current_timestamp
);

/*this is createing the table -Ross */
CREATE TABLE employee (
  record_id uuid NOT NULL primary key,
  first_name char(10) NOT NULL DEFAULT(''),
  last_name char(15) NOT NULL DEFAULT(''),
  employee_id int,
  active Char(2), CHECK ((active='Y') OR (active='N')) NOT NULL DEFAULT('N'),
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

