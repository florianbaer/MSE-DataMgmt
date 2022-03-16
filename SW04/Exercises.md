# Exercises 

````sql
help

use exercise1;

db.unicorns.insertOne({name: 'Aurora', gender: 'f', weight: 450})

db.unicorns.find()

db.unicorns.insertOne({name: 'PaperBlade', gender: 'm', loves: ['apple','grape'],weight: 610})
db.unicorns.insertOne({name: 'Samsonici', gender: 'm', loves: ['Valorant','Counter Strike'],weight: 1610})
db.unicorns.insertOne({name: 'Toni', gender: 'm', loves: ['Valorant','Counter Strike'],weight: 501, sports:["Floorball"]})
db.unicorns.insertOne({name: 'Gino', gender: 'm', loves: ['Valorant','Satisfactory'],weight: 501, sports:["Floorball"]})
db.unicorns.find()
// mongoexport --db exercise1 --collection unicorns --out my_unicorns.json

db.unicorns.removeMany({})
db.unicorns.find()

// mongoimport --db exercise1 --collection unicorns my_unicorns.json

use exercise2
db.unicorns.find()
db.unicorns.insertOne({name: 'Horny', dob: new Date(1992,2,13,7,47), loves:      ['carrot','papaya'], weight: 600, gender: 'm', vampires: 63});
db.unicorns.insertOne({name: 'Aurora', dob: new Date(1991, 1, 24, 13, 0), loves:
['carrot', 'grape'], weight: 450, gender: 'f', vampires: 43});
db.unicorns.insertOne({name: 'Unicrom', dob: new Date(1973, 1, 9, 22, 10),
loves: ['energon', 'redbull'], weight: 984, gender: 'm', vampires: 182});
db.unicorns.insertOne({name: 'Roooooodles', dob: new Date(1979, 7, 18, 18, 44),
loves: ['apple'], weight: 575, gender: 'm', vampires: 99});
db.unicorns.insertOne({name: 'Solnara', dob: new Date(1985, 6, 4, 2, 1),
loves:['apple', 'carrot', 'chocolate'], weight:550, gender:'f',
vampires:80});
db.unicorns.insertOne({name: 'Ayna', dob: new Date(1998, 2, 7, 8, 30), loves:
['strawberry', 'lemon'], weight: 733, gender: 'f', vampires: 40});
db.unicorns.insertOne({name: 'Kenny', dob: new Date(1997, 6, 1, 10, 42), loves:
['grape', 'lemon'], weight: 690, gender: 'm', vampires: 39});
db.unicorns.insertOne({name: 'Raleigh', dob: new Date(2005, 4, 3, 0, 57), loves:
['apple', 'sugar'], weight: 421, gender: 'm', vampires: 2});
db.unicorns.insertOne({name: 'Leia', dob: new Date(2001, 9, 8, 14, 53), loves:
['apple', 'watermelon'], weight: 601, gender: 'f', vampires: 33});
db.unicorns.insertOne({name: 'Pilot', dob: new Date(1997, 2, 1, 5, 3), loves:
['apple', 'watermelon'], weight: 650, gender: 'm', vampires: 54});
db.unicorns.insertOne({name: 'Nimue', dob: new Date(1999, 11, 20, 16, 15),
loves: ['grape', 'carrot'], weight: 540, gender: 'f'});
db.unicorns.insertOne({name: 'Dunx', dob: new Date(1976, 6, 18, 18, 18), loves:
['grape', 'watermelon'], weight: 704, gender: 'm', vampires: 165});


db.unicorns.find({name:'Aurora'})
db.unicorns.find({gender: 'f',loves:'apple'})
db.unicorns.find({gender: 'f',loves: { $all:['apple', 'carrot']}})
db.unicorns.find({gender:'f',$and:[{loves:'apple'},{loves:'carrot'}]})
/*
$regex Match by any PCRE-compliant regular expression string (or just use the
// delimiters as shown earlier)
$ne Not equal to
$lt Less than
$lte Less than or equal to
$gt Greater than
$gte Greater than or equal to
$exists Check for the existence of a field
$all Match all elements in an array
$in Match any elements in an array
$nin Does not match any elements in an array
$elemMatch Match all fields in an array of nested documents
$or or
$nor Not or
$size Match array of given size
$mod Modulus
$type Match if field is a given datatype
$not Negate the given operator check
*/
db.unicorns.find()

db.unicorns.find({gender:'f',dob : {$gt: new Date(1999, 11, 20, 16, 15)}})
db.unicorns.find({gender:'f',dob : {$gte: new Date(1999, 11, 20, 16, 15)}})
db.unicorns.find({gender:'f', name: {$regex:'Aurora|Ayna'}})
db.unicorns.find({gender:'f', loves: {$nin:['carrot']}})


db.unicorns.find({gender:'f', loves: {$nin:['carrot']}},{_id:0})
db.unicorns.find({gender:'f',$or:[{loves:'apple'}, {loves:'carrot'}]},{_id:0, name:1, gender:1, dob:1})



```
