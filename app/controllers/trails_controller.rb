class TrailsController < ApplicationController
  def show
    @trail = Trail.find(params[:id])
    @number_of_trips = @trail.trips.count
  end
end
