class TrailsController < ApplicationController
  def show
    @trail = Trail.find(params[:id])
    @trips = @trail.trips
  end
end
