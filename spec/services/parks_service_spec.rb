require "rails_helper"

RSpec.describe ParksService do 
  before(:each) do 
    @service = ParksService.new
  end
  describe "exists", :vcr do 
    it "is a service" do 
      expect(@service.get_parks("TN")).to be_a(Faraday::Response)
    end
  end
end