require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set :show_exceptions, false

describe 'the favorite things path', :type => :feature do
  it 'contains a form' do
    visit '/'
    expect(page).to have_field("thing")
  end

  it 'starts with an empty list' do
    visit '/'
    expect(page).not_to have_selector 'li'
  end

  it 'will display the new list item after submiting it' do
    visit '/'
    fill_in 'thing', :with => 'foo'
    fill_in 'ranking', :with => '2'
    click_button 'Add'
    expect(page).to have_content 'foo / 2'
  end
end
