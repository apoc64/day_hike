require 'rails_helper'

describe 'visitor visits hiking show' do

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

  it 'shows total hiking distance' do
    trip = Trip.create(name: 'Grays and Torys')
    trail1 = trip.trails.create(name: 'North trail', length: 5, address: '123 Mountain St')
    trail2 = trip.trails.create(name: 'South trail', length: 7, address: '321 Mountain St')

    visit trip_path(trip)

    total = trail1.length + trail2.length

    expect(page).to have_content("Total length: #{total}")
  end

  it 'shows the average trail distance' do
    trip = Trip.create(name: 'Grays and Torys')
    trail1 = trip.trails.create(name: 'North trail', length: 5, address: '123 Mountain St')
    trail2 = trip.trails.create(name: 'South trail', length: 7, address: '321 Mountain St')

    visit trip_path(trip)

    average = (trail1.length + trail2.length) / 2

    expect(page).to have_content("Average length: #{average}")
  end

  it 'shows the longest trail length' do
    trip = Trip.create(name: 'Grays and Torys')
    trip.trails.create(name: 'North trail', length: 5, address: '123 Mountain St')
    trail2 = trip.trails.create(name: 'South trail', length: 7, address: '321 Mountain St')

    visit trip_path(trip)

    expect(page).to have_content("Longest trail length: #{trail2.length}")
  end

  it 'shows the shortest trail length' do
    trip = Trip.create(name: 'Grays and Torys')
    trail1 = trip.trails.create(name: 'North trail', length: 5, address: '123 Mountain St')
    trip.trails.create(name: 'South trail', length: 7, address: '321 Mountain St')

    visit trip_path(trip)

    expect(page).to have_content("Shortest trail length: #{trail1.length}")
  end

  it 'can navigate to a trail show' do
    trip = Trip.create(name: 'Grays and Torys')
    trail1 = trip.trails.create(name: 'North trail', length: 5, address: '123 Mountain St')
    trip.trails.create(name: 'South trail', length: 7, address: '321 Mountain St')

    visit trip_path(trip)

    click_on trail1.name

    expect(current_path).to eq(trail_path(trail1))
  end
end
