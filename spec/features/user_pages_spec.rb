require 'spec_helper'

feature 'User Pages' do

  subject {page}

  context "sign up page" do
    background {visit signup_path}

    scenario { should have_content 'Sign up'}
    scenario { should have_title (full_title 'Sign up')  }
  end

end
