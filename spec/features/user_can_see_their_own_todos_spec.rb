require "rails_helper"

feature "user see their own to-dos" do 

	scenario "successfully" do
		
		#user 1 signs in
		visit new_session_path
		fill_in "Email", with: "user@example.com"
		click_on "Sign In"

		#user 1 creates a to do via a form
		#this test language and capitalization needs to match up 
		click_on "Add a New To-Do"
		fill_in "Title", with: "paint house"

		#user 2 creates a to-do via form (create saves) 
		Todo.create(title: "buy milk", email: "somebody@example.com")

		#user 1 user 1 will save to-do in the database
		click_on "Add To-Do"

		#verify that the todo for user 1 was saved and can be viewed
		expect(page).to have_css ".todos li", text: "paint house"
		expect(page).not_to have_css ".todos li", text: "buy milk"

	
	end
	

end