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
  # As a visitor,
  # when I visit the hiking trips index page,
  # and I click on the name of a hiking trip,
  # I see a unique page for that hiking trip.
  it 'can navigate to show page' do
    trip1 = Trip.create(name: 'Grays')
    trip2 = Trip.create(name: 'Torys')

    visit trips_path

    click_on trip1.name

    expect(current_path).to eq(trip_path(trip1))
    expect(page).to have_content(trip1.name)
  end
end
