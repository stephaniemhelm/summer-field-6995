# Story 2
# Movie Show
#
# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors

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
end
