class ParksService 
  def get_parks(state)
     conn = Faraday.new("https://developer.nps.gov") do |faraday| 
      faraday.headers["X-Api-Key"] = ENV["NPS_KEY"]
    end

    response = conn.get("/api/v1/parks?stateCode=#{state}")
  end
end