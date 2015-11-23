require "rails_helper"

feature "user creates a to-do" do 
	scenario "successfully" do

		#visit root_path
		visit root_path

		#user creates a to-do via a form
		click_on "Add a New To-Do"
		fill_in "Title", with: "paint house"

		#user save the to-do to the database
		click_on "Add To-Do"
		#verify that the page has our to-do
		expect(page).to have_css ".todos li", text: "paint house"
end 
	
end