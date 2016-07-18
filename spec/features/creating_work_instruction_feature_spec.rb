require 'rails_helper'

RSpec.feature "creating work instruction" do
  scenario "with valid inputs success" do
    visit root_path
    click_link "New Work Instruction"
    fill_in "Name", with: "Process"
    fill_in "Code", with: "CP1A"
    fill_in "Description", with: "Lorem Ipsum"

    click_button "Submit"

    expect(page).to have_content 'New instructions have been created!'
  end
end
