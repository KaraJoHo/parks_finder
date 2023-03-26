require "rails_helper"

RSpec.describe "Parks Index Page" do 
  describe "when routed to the parks page from the welcome page", :vcr do 
    it "has a list of park information from the state that was selected" do 
      visit root_path 
      select("Tennessee", from: :state)
      click_button "Find Parks"

      expect(current_path).to eq(parks_path)
      expect(page).to have_content("Parks in: TN")
      expect(page).to have_content("Number of Parks: 15")

      within("#park_info_2ED6E071-57AA-4B08-8DDA-5CB09FBB75C8") do 
        expect(page).to have_content("Name: Andrew Johnson National Historic Site")
        expect(page).to have_content("Description: Andrew Johnson's complex presidency (1865-69) illustrates the Constitution at work following the Civil War. As the President and Congress disagreed on Reconstruction methods, the Constitution served as their guide on balance of powers, vetoes, and impeachment. In the end, it evolved as a living document with pivotal amendments on freedom, citizenship, and voting rights - topics still vital today.")
        expect(page).to have_content("Directions: GPS The GPS setting for Andrew Johnson NHS may be listed as 121 Monument Ave, which is the park HQ in the National Cemetery. To arrive at the Visitor Center, use 101 North College Street, Greeneville, TN. Plane The closest airport is the Tri-Cities Regional Airport, 43 miles NE of Greeneville. From the airport, take I-81 South to exit 36 and follow the signs to Greeneville. Car From I-81S take exit 36 to Rt. 172 south to Greeneville. From I-81N take exit 23 to Rt. 11E north to Greeneville.")
        expect(page).to have_content("Standard Hours:")
        expect(page).to have_content(":wednesday, ")
        expect(page).to have_content("9:00AM - 4:00PM")
      end
    end

    it "has a link to the welcome page to find parks" do 
      visit root_path 
      select("Tennessee", from: :state)
      click_button "Find Parks" 
      
      expect(page).to have_link("Find Parks")
      click_link("Find Parks")
      expect(current_path).to eq(root_path)
    end
  end
end