universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
shrek = universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')


ford = Actor.create(name: 'Harrison Ford', age: 67)
allen = Actor.create(name: 'Karen Allen', age: 55)
freeman = Actor.create(name: 'Paul Freeman', age: 75)
lacey = Actor.create(name: 'Ronald Lacey', age: 38)

murphy = Actor.create(name: 'Eddie Murphy', age: 42)
diaz = Actor.create(name: 'Cameron Diaz', age: 33)
myers = Actor.create(name: 'Mike Meyers', age: 45)
