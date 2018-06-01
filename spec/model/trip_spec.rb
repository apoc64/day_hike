require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'relationships' do
    it {should have_many(:trails).through(:trail_trips)}
  end
end
