require 'spec_helper'

describe User do

  before :each do
    @user = User.new(
      name: "Example User", 
      email: '123@123.com',
      password: 'foobar',
      password_confirmation: 'foobar')
  end

  subject {@user}

  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password_digest }
  it { should respond_to :password}
  it { should respond_to :password_confirmation }
  it { should respond_to :authenticate }




  it { should be_valid }

  describe "when name is missing" do
    before { @user.name = "" }
    it { should_not be_valid  }
  end

  describe "when email is missing" do
    before { @user.email = "" }
    it { should_not be_valid  }
  end

  describe "when name is too long" do
    before { @user.name = 'a' * 51 }
    it { should_not be_valid }

  end

  describe "email format is import" do
    it "has valid email" do
      address = %w[haha@123.com COM@COM.123.COM ASF-AS34@ASDF.com]
      address.each do |email|
        @user.email = email
        expect(@user).to have(0).errors_on(:email)
      end
    end

    it "has invalid email" do
      address = %w[@a+sf,123.com COMCOM.123.COM ASF_AS34ASDFcom@]
      address.each do |email|
        @user.email = email
        expect(@user).to have(1).errors_on(:email)
      end
    end

  end

  describe "email must be unique" do
    before do
      user1 = @user.dup
      user1.email = @user.email.upcase
      user1.save
    end

    it { should_not be_valid }

  end


  describe "when passowrd is not present" do
    before do
      @user.password = ""
      @user.password_confirmation = ""
    end

    it { should_not be_valid }

  end

  describe "when password does not match" do
    before {@user.password_confirmation = "123132"}

    it { should_not be_valid }

  end

  describe "return value of authentivate method" do
    before { @user.save }
    let (:found_user) { User.find_by(email: @user.email) }
    describe "with valid password" do
      it { should eq found_user.authenticate @user.password }
    end

    describe "with invalid password" do
      it { should_not eq found_user.authenticate "asdf"  }

    end
  end

  describe "password must long enough" do
    before {  @user.password = @user.password_confirmation ="aaaaa" }

    it { should_not be_valid }

  end

end
