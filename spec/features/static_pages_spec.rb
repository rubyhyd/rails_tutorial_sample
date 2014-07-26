require 'spec_helper'

feature 'open static pages' do

  subject {page}
  
  context "Open Home Page" do
    background {visit root_path}
    
    scenario {should have_content 'Sample App'}

    scenario {should have_title (full_title "")}
  end

  context "Open Help Page" do
    background {visit help_path}

    scenario {should have_content 'Help'}

    scenario {should have_title (full_title "Help")}
  end

  context "Open About Page" do
    background {visit about_path}
   
    scenario {should have_content 'About Us'}
    
    scenario {should have_title (full_title "About")}
  end


end
