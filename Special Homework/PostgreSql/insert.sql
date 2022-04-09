create database families;

create extension hstore;

CREATE DOMAIN zipcode varchar(4)
    CONSTRAINT valid_zipcode
    CHECK (VALUE ~ '[0-9]{4}');

create table address(
    id serial primary key,
    address varchar(100),
    zip zipcode,
    rent money,
    city varchar(50)
);

create table person (
    id serial primary key,
    name varchar(50),
    born int,
    working boolean,
    salary money,
    lives_at int,
    foreign key (lives_at) references address(id)
);

create table relation_type (
    id serial primary key,
    name varchar(50)
);

create table family_relation (
    id serial primary key,
    relation_type int,
    from_person int,
    to_person int,
    details hstore,
    foreign key (relation_type) references relation_type(id),
    foreign key (from_person) references person(id),
    foreign key (to_person) references person(id)
);


insert into address(id, address, zip, city, rent) values (2, 'Luzernerstrasse 23', 1234, 'Testcity', 3500) RETURNING id;
insert into address(id, address, zip, city, rent) values (3, 'Luzernerstrasse 21', 1233, 'Citonia', 1500) RETURNING id;


insert into person(id,name, born, working, salary, lives_at) values(1, 'Franziska Meier', 1965, true, 85000, 2);
insert into person(id,name, born, working, salary, lives_at) values(2, 'Frizli Meier', 1962, true, 60000, 2);
insert into person(id,name, born, working, salary, lives_at) values(3, 'Vreni Meier', 1992, true, 65000, 2);
insert into person(id,name, born, working, salary, lives_at) values(4, 'Andy Meier', 1994, true, 60000, 2);
insert into person(id,name, born, working, salary, lives_at) values(5, 'Walter Meier', 1924, false, 50000, 3);
insert into person(id,name, born, working, salary, lives_at) values(6, 'Sara Meier', 1924, false, 50000, 3);

insert into relation_type(id, name) values(1, 'CHILD_OF');
insert into relation_type(id, name) values(2, 'MARRIED_TO');

insert into family_relation(relation_type, from_person, to_person, details) VALUES (2, 1, 2, 'since=>1990::int');
insert into family_relation(relation_type, from_person, to_person, details) VALUES (2, 5, 6, 'since=>1961::int');
insert into family_relation(relation_type, from_person, to_person) VALUES (1, 3, 1);
insert into family_relation(relation_type, from_person, to_person) VALUES (1, 3, 2);
insert into family_relation(relation_type, from_person, to_person) VALUES (1, 4, 1);
insert into family_relation(relation_type, from_person, to_person) VALUES (1, 4, 2);
insert into family_relation(relation_type, from_person, to_person) VALUES (1, 2, 5);
insert into family_relation(relation_type, from_person, to_person) VALUES (1, 2, 6);