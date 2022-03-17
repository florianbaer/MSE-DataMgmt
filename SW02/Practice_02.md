# Preconditions

``` sql
sakila=# create database test;
-- CREATE DATABASE
sakila=# create database workbench;
-- CREATE DATABASE
sakila=# create database arrays;
-- CREATE DATABASE
sakila=# create database work;
-- CREATE DATABASE
```

# Exercise 1

``` sql
WITH TempTable(a, b) AS (
 VALUES 
  (0,-9999), 
   (1, 100)
   
) 
SELECT * FROM TempTable;
```

# Exercise 3

``` sql
-- 1. Exercise
SELECT * from ab;
-- 2. Exercise
SELECT cardinality(b) FROM ab;
SELECT array_length(b,1) from ab; -- 1 for the first dimension
-- 3. Exercise
SELECT array_length(b,1) from ab where a = 1;
-- 4. Exercise
UPDATE ab 
SET b = array_append (b, 5)
WHERE a = 1;

UPDATE ab
SET b = array_cat(ARRAY[5], b)
WHERE a = 2;

-- 5. Exercise
SELECT array_to_string(b, ';', '*')
FROM ab 
WHERE a = 1;

-- 6. Exercise
SELECT b[2][1]
FROM ab 
WHERE a = 3;

-- 7. Exercise
SELECT a, b, unnest(b)
FROM ab
WHERE a = 2;

```
