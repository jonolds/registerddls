CREATE EXTENSION "uuid-ossp";

/*this is createing the table -Ross */
CREATE TABLE employee (
  id uuid NOT NULL,
  first_name char(10),
  last_name char(15),
  lookupcode character varying(32) NOT NULL DEFAULT(''),
  count int NOT NULL DEFAULT(0),
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT product_pkey PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

/*IDK what this is -Ross*/
CREATE INDEX ix_product_lookupcode
  ON product
  USING btree
  (lower(lookupcode::text) COLLATE pg_catalog."default");

/*Inserting a test record -Ross*/
INSERT INTO employee VALUES (
       uuid_generate_v4()
     , 'lookupcode1'
     , 100
     , current_timestamp
);

