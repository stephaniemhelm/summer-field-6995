
require 'rails_helper'

RSpec.describe Movie do
  it 'can show the movies title, creation year and genre' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    shrek = universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')
    murphy = Actor.create(name: 'Eddie Murphy', age: 42)
    diaz = Actor.create(name: 'Cameron Diaz', age: 33)
    myers = Actor.create(name: 'Mike Meyers', age: 45)
    movie_actor5 = MovieActor.create(movie_id: shrek.id, actor_id: murphy.id)
    movie_actor6 = MovieActor.create(movie_id: shrek.id, actor_id: diaz.id)
    movie_actor7 = MovieActor.create(movie_id: shrek.id, actor_id: myers.id)

    visit "/movies/#{shrek.id}"

    expect(page).to have_content(shrek.title)
    expect(page).to have_content(shrek.creation_year)
    expect(page).to have_content(shrek.genre)
    expect(page).to have_content(murphy.name)
    expect(page).to have_content(diaz.name)
    expect(page).to have_content(myers.name)

  end

  it 'can add an actor to a movie by name' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    shrek = universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')
    murphy = Actor.create(name: 'Eddie Murphy', age: 42)
    diaz = Actor.create(name: 'Cameron Diaz', age: 33)
    myers = Actor.create(name: 'Mike Meyers', age: 45)
    movie_actor5 = MovieActor.create(movie_id: shrek.id, actor_id: murphy.id)
    movie_actor6 = MovieActor.create(movie_id: shrek.id, actor_id: diaz.id)
    movie_actor7 = MovieActor.create(movie_id: shrek.id, actor_id: myers.id)
    ford = Actor.create(name: 'Harrison Ford', age: 67)

    visit "/movies/#{shrek.id}"

    expect(page).to_not have_content(ford.name)
    click_button 'Add Actor'
    expect(page).to have_content(ford.name)

  end
end


# Story 3
# Add an Actor to a Movie
#
# As a user,
# When I visit a movie show page,
# I do not see any actors listed that are not part of the movie
# And I see a form to add an actor to this movie
# When I fill in the form with the name of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
