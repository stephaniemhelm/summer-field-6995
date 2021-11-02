require 'rails_helper'

RSpec.describe Actor do
  it 'can show actors name and age' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    shrek = universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')
    murphy = Actor.create(name: 'Eddie Murphy', age: 42)
    diaz = Actor.create(name: 'Cameron Diaz', age: 33)
    myers = Actor.create(name: 'Mike Meyers', age: 45)
    movie_actor5 = MovieActor.create(movie_id: shrek.id, actor_id: murphy.id)
    movie_actor6 = MovieActor.create(movie_id: shrek.id, actor_id: diaz.id)
    movie_actor7 = MovieActor.create(movie_id: shrek.id, actor_id: myers.id)

    visit "/actors/#{murphy.id}"
    expect(page).to have_content(murphy.name)
    expect(page).to have_content(murphy.age)
  end

  xit 'can show a list of actors worked with' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    shrek = universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')
    murphy = Actor.create(name: 'Eddie Murphy', age: 42)
    diaz = Actor.create(name: 'Cameron Diaz', age: 33)
    myers = Actor.create(name: 'Mike Meyers', age: 45)
    movie_actor5 = MovieActor.create(movie_id: shrek.id, actor_id: murphy.id)
    movie_actor6 = MovieActor.create(movie_id: shrek.id, actor_id: diaz.id)
    movie_actor7 = MovieActor.create(movie_id: shrek.id, actor_id: myers.id)

    visit "/actors/#{murphy.id}"
    expect(page).to have_content(diaz.name)
    expect(page).to have_content(myers.name)
  end


end
