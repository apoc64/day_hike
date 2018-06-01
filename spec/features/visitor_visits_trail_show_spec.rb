require 'rails_helper'

describe 'visitor visits' do

  it 'shows trail info' do
    trail = Trail.create(name: 'North trail', length: 5, address: '123 Mountain St')

    visit trail_path(trail)

    expect(page).to have_content(trail.name)
    expect(page).to have_content(trail.length)
    expect(page).to have_content(trail.address)
  end

  it 'shows total number of trips for this trail' do
    trail = Trail.create(name: 'North trail', length: 5, address: '123 Mountain St')
    trail.trips.create(name: 'Grays and Torys')
    trail.trips.create(name: 'Super Mountain Hike')
    trail.trips.create(name: 'Rocky Mountain Park')

    visit trail_path(trail)

    expect(page).to have_content("Number of trips: #{trail.trips.count}")
  end
end
