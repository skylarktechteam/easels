require "rails_helper"

feature "user visits home page" do 

	scenario "successfully" do

		visit root_path
		expect(page).to have_css 'h1', text: 'To-Dos'
	end
end

