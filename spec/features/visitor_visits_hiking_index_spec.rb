# As a visitor,
# when I visit the hiking trips index page,
# I see a list of all hiking trip names in
# the database.

require 'rails_helper'

describe 'visitor visits trips index' do
  it 'shows a list of all trips' do
    trip1 = Trip.create(name: 'Grays')
    trip2 = Trip.create(name: 'Torys')

    visit trips_path

    expect(page).to have_content(trip1.name)
    expect(page).to have_content(trip2.name)
  end
end
