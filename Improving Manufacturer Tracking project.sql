SELECT * FROM parts LIMIT 10;

ALTER TABLE parts
ADD UNIQUE(code);

ALTER TABLE parts
ALTER COLUMN code SET NOT NULL;

UPDATE parts
SET description = 'Non Available'
WHERE description IS NULL;

ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;

ALTER TABLE parts
ADD PRIMARY KEY(id);

ALTER TABLE parts
ADD FOREIGN KEY(manufacturer_id) REFERENCES manufacturers(id);

ALTER TABLE parts
ALTER COLUMN manufacturer_id SET NOT NULL;

/**IMPROVING REORDERING OPTIONS**/

ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL;

ALTER TABLE reorder_options
ALTER COLUMN Quantity SET NOT NULL;

ALTER TABLE reorder_options 
ADD CHECK (price_usd > 0 AND quantity > 0);

ALTER TABLE reorder_options
ADD CHECK (price_usd/quantity > 0.02 
AND price_usd/quantity < 25.00);

ALTER TABLE reorder_options
ADD FOREIGN KEY (part_id) REFERENCES parts (id);

/** improvin Location Tracking **/

ALTER TABLE locations
ADD CHECK( qty > 0);

ALTER TABLE locations
ADD UNIQUE (part_id, location);

ALTER TABLE locations
ADD FOREIGN KEY(part_id) REFERENCES parts(id);

ALTER TABLE parts
ADD FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id);


INSERT INTO manufacturers(name, id) 
VALUES ('Pip-NNC Industrial',11);

UPDATE parts
SET manufacturer_id =11
WHERE manufacturer_id IN(parts, manufacture);


