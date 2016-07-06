require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the places we've been path", {:type => :feature}) do
  it ("displays a list of places the user has been and allows the user to add locations to the list") do
    visit('/')
    fill_in('location', :with => "Washington, D.C.")
    click_button('Add place')
    expect(page).to have_content("The place has been successfully submitted!")
  end
end

describe("the go back path", {:type => :feature}) do
  it ("allows the user to go back to the index to see the updated list and add more locations") do
    visit('/success')
    click_link('Back')
    expect(page).to have_content("Add a place to the list:")
  end
end
