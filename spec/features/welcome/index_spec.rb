require "rails_helper"

RSpec.describe "Welcome Index Page" do 
  before(:each) do 
    visit root_path
  end

  describe "when visiting '/' ", :vcr do 
    it " has a form to select a state to search for parks" do 
      expect(page).to have_link("Park Search")
      expect(page).to have_field(:state)
      expect(page).to have_button("Find Parks")
    end

    it "can select a state to see the parks in that state" do 
      select("Tennessee", from: :state)
      click_button "Find Parks"
      expect(current_path).to eq(parks_path)
      expect(page).to have_content("Parks in: TN")
    end
  end
end