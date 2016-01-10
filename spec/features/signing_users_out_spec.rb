require 'rails_helper'

RSpec.feature "Signing out signed-in users" do
  before do
    @jon = User.create!(email: "jon@email.com", password: "password")
    visit '/'

    click_link "Sign in"
    fill_in "Email", with: @jon.email
    fill_in "Password", with: @jon.password
    click_button "Log in"
  end

  scenario do

    visit '/'
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
