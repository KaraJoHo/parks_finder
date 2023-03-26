class ParksController < ApplicationController 
  def index 
    @state = params[:state]
    @parks = ParksFacade.new(params[:state])
  end
end