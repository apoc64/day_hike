require 'rails_helper'

describe 'visitor visits trips index' do
  it 'shows a list of all trips' do
    trip1 = Trip.create(name: 'Grays')
    trip2 = Trip.create(name: 'Torys')

    visit trips_path

    expect(page).to have_content(trip1.name)
    expect(page).to have_content(trip2.name)
  end

  it 'can navigate to show page' do
    trip1 = Trip.create(name: 'Grays')
    Trip.create(name: 'Torys')

    visit trips_path

    click_on trip1.name

    expect(current_path).to eq(trip_path(trip1))
    expect(page).to have_content(trip1.name)
  end
end
