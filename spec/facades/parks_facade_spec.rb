require "rails_helper"

RSpec.describe ParksFacade do 
  before(:each) do 
    @facade = ParksFacade.new("TN")
  end

  describe "facade", :vcr do 
    it "exists and has attributes" do 
      expect(@facade).to be_a(ParksFacade)
      expect(@facade.num_of_parks).to eq(15)
      expect(@facade.parks).to be_a(Array)
      expect(@facade.parks.first).to be_a(Park)
    end
  end
end