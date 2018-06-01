class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @trails = @trip.trails
    @total = @trails.sum(:length)
    @average = @trails.average(:length)
    @longest = @trails.maximum(:length)
    @shortest = @trails.minimum(:length)
  end
end
