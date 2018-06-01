require 'rails_helper'

describe 'visitor visits' do
# As a visitor,
# when I visit a trail's page,
# I see the name, address, and total length of
# every hiking trip that includes this trail
  it 'shows trail info' do
    trail = Trail.create(name: 'North trail', length: 5, address: '123 Mountain St')

    visit trail_path(trail)

    expect(page).to have_content(trail.name)
    expect(page).to have_content(trail.length)
    expect(page).to have_content(trail.address)
  end
end
