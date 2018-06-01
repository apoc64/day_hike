require 'rails_helper'

describe 'visitor visits hiking show' do
# As a visitor,
# when I visit a hiking trip's page,
# I see a list of trails included in the trip,
# I see the name, address, and length for each trail.
  it 'shows all trials for that trip' do
    trip = Trip.create(name: 'Grays and Torys')
    trail1 = trip.trails.create(name: 'North trail', length: 5, address: '123 Mountain St')
    trail2 = trip.trails.create(name: 'South trail', length: 7, address: '321 Mountain St')

    visit trip_path(trip)

    expect(page).to have_content(trail1.name)
    expect(page).to have_content(trail1.length)
    expect(page).to have_content(trail1.address)
    expect(page).to have_content(trail2.name)
    expect(page).to have_content(trail2.length)
    expect(page).to have_content(trail2.address)
  end
#   As a visitor,
# when I visit a hiking trip's page,
# I see the total hiking distance
# of all trails on that hiking trip
  it 'shows total hiking distance' do
    trip = Trip.create(name: 'Grays and Torys')
    trail1 = trip.trails.create(name: 'North trail', length: 5, address: '123 Mountain St')
    trail2 = trip.trails.create(name: 'South trail', length: 7, address: '321 Mountain St')

    visit trip_path(trip)

    total = trail1.length + trail2.length

    expect(page).to have_content("Total length: #{total}")
  end
end