require 'spec_helper'

feature 'open static pages' do

  scenario 'Home Page has content "Sample App"' do
    visit '/static_pages/home'
    expect(page).to have_content 'Sample App'
  end

  scenario 'Help Page has content "Help"' do
    visit '/static_pages/help'
    expect(page).to have_content 'Help'
  end

  scenario 'About Page' do
    visit '/static_pages/about'
    expect(page).to have_content 'About Us'
  end

  scenario 'Pages have right titles' do
    visit '/static_pages/home'
    expect(page).to have_title 'RoR SampleApp | Home'
    visit '/static_pages/help'
    expect(page).to have_title 'RoR SampleApp | Help'
    visit '/static_pages/about'
    expect(page).to have_title 'RoR SampleApp | About'

  end

end
