require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe 'relationships' do
    it {should have_many(:trips).through(:trail_trips)}
  end
end
