require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many(:movie_actors) }
    it {should have_many(:movies).through(:movie_actors)}
  end

  it 'can order actors by age' do
    murphy = Actor.create(name: 'Eddie Murphy', age: 42)
    diaz = Actor.create(name: 'Cameron Diaz', age: 33)
    myers = Actor.create(name: 'Mike Meyers', age: 45)

    expect(Actor.age_order).to eq([diaz, murphy, myers])
  end

  it 'can calculate the average age of the actors' do
    murphy = Actor.create(name: 'Eddie Murphy', age: 42)
    diaz = Actor.create(name: 'Cameron Diaz', age: 33)
    myers = Actor.create(name: 'Mike Meyers', age: 45)

    expect(Actor.average_age).to eq(40)
  end
end
