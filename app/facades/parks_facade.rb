class ParksFacade 
  attr_reader :num_of_parks
  def initialize(state)
    @state = state
    @num_of_parks = parks.count
  end

  def parks 
    response = service.get_parks(@state)
    json = JSON.parse(response.body, symbolize_names: true)[:data]
   
    @parks = json.map do |park|
      Park.new(park)
    end
  end

  def service 
    ParksService.new
  end
end