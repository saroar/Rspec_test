require 'rails_helper'

RSpec.feature "Users Sign-in" do
  before do
    @jon = User.create!(email: "jon@gmail.com", password: "password")
  end

  scenario "with valid credentials" do
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: @jon.email
    fill_in "Password", with: @jon.password
    click_button "Log in"

    expect(page).to have_content("Signed in Successfully")
    expect(page).to have_content("Signed in as #{@jon.email}")
  end
end
