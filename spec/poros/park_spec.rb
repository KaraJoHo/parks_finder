require "rails_helper"

RSpec.describe Park do 
  before(:each) do 
    file = File.read("./spec/fixtures/parks/tn_parks.json")
    @parks = JSON.parse(file, symbolize_names: true)[:data]
    @park = Park.new(@parks.first)
    
  end

  describe "park" do 
    it "exists and has attributes" do 
      expect(@park).to be_a Park
      expect(@park.full_name).to eq("Andrew Johnson National Historic Site")
      expect(@park.id).to eq("2ED6E071-57AA-4B08-8DDA-5CB09FBB75C8")
      expect(@park.description).to eq("Andrew Johnson's complex presidency (1865-69) illustrates the Constitution at work following the Civil War. As the President and Congress disagreed on Reconstruction methods, the Constitution served as their guide on balance of powers, vetoes, and impeachment. In the end, it evolved as a living document with pivotal amendments on freedom, citizenship, and voting rights - topics still vital today.")
      expect(@park.direction_info).to eq("GPS The GPS setting for Andrew Johnson NHS may be listed as 121 Monument Ave, which is the park HQ in the National Cemetery. To arrive at the Visitor Center, use 101 North College Street, Greeneville, TN. Plane The closest airport is the Tri-Cities Regional Airport, 43 miles NE of Greeneville. From the airport, take I-81 South to exit 36 and follow the signs to Greeneville. Car From I-81S take exit 36 to Rt. 172 south to Greeneville. From I-81N take exit 23 to Rt. 11E north to Greeneville.")
      expect(@park.standard_hours).to eq({
                        "wednesday": "9:00AM - 4:00PM",
                        "monday": "Closed",
                        "thursday": "9:00AM - 4:00PM",
                        "sunday": "9:00AM - 4:00PM",
                        "tuesday": "Closed",
                        "friday": "9:00AM - 4:00PM",
                        "saturday": "9:00AM - 4:00PM"
                    })
    end
  end
end