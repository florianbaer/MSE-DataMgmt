# Ex 0

`CREATE DATABASE 'movie_db;`

`\c 'movie_db';`

`CREATE EXTENSION hstore;`

`\dx hstore`

# Ex 1


`create table movies (movie_id INT PRIMARY KEY, title TEXT, attributes HSTORE);`

```sql
insert into movies (movie_id, title, attributes)
values (1, 'The Avengers', '"release_date" => "01.02.2021", "duration_in_min" => 1234, "director" => "me myself and i", "actors" => "{jonny depp,dini mueter}", "genre" => "thriller"');
insert into movies (movie_id, title, attributes)
values (2, 'Test2', '"release_date" => "01.3.2021", "duration_in_min" => 11, "director" => "me 2", "actors" => "{franzen,dini mueter}", "genre" => "thriller"');
insert into movies (movie_id, title, attributes)
values (3, 'The Av3', '"release_date" => "01.02.2020", "duration_in_min" => 123, "director" => "i", "actors" => "{jonny däpp,dini mueter}", "genre" => "adventure"');
insert into movies (movie_id, title, attributes)
values (4, 'Test23', '"release_date" => "01.3.2121", "duration_in_min" => 311, "director" => "me", "actors" => "{fff,as mueter}", "genre" => "scifi"');
insert into movies (movie_id, title, attributes)
values (5, 'Test333', '"release_date" => "01.3.1901", "duration_in_min" => 11, "director" => "ddd", "actors" => "{dd,as}", "genre" => "doc"');
```

```sql
update movies 
set attributes = "attributes" || '"production_company"=>"24"'::hstore
where movie_id = 3
```

# Ex 2

```sql
select *,"attributes"->'actors',"attributes"->'production_company' from movies m ;
select *,"attributes"->'actors',"attributes"->'duration_in_min' as duration from movies m where attributes->'duration_in_min' <= '120';
select *,"attributes"->'actors',"attributes"->'duration_in_min' as duration from movies m where attributes->'genre' = 'thriller';
select *,"attributes"->'actors',"attributes"->'duration_in_min' as duration from movies m where attributes ? 'director' and "attributes" ? 'production_company';
```

# Ex 3
(Terminal)[https://terminal.osmdatapipeline.geoh.infs.ch/]

```sql
SELECT geom, osm_id, name
FROM osm_point
WHERE tags @> hstore('tourism', 'zoo')
-- WHERE tags @> 'tourism=>zoo' -- other option!
```

Yes the other option works as well because hstores are stored as array values in psql.

```sql

select *,
	tags->'tourism' as featureclass
from osm_location
where tags->'tourism' in ('camp_site','caravan_site','camp_pitch');
``` - copied from examples