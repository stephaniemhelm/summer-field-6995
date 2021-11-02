# Studio Index
#
# As a user,
# When I visit the studio index page
# I see a each studio's name and location
# And underneath each studio, I see the titles of all of its movies.

require 'rails_helper'

RSpec.describe Studio do
  it 'can show each studios name, location, and movies' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    shrek = universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')

    visit '/studios'

    expect(page).to have_content(universal.name)
    expect(page).to have_content(universal.location)
    expect(page).to have_content(ark.title)
    expect(page).to have_content(shrek.title)

  end

end
