require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do
      @user = User.create(
        first_name: "testFirstName",
        last_name: "testLastName",
        email: "email@email.com",
        password: "hello",
        password_confirmation: "hello",
      )
    end

    it "saves the model if all fields are present" do
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end

    it "expects error when passwords dont match" do
      @user.password = "hello"
      @user.password_confirmation = "hi"
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "expects error when no password is provided" do
      @user.password = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "expects error when no password_confirmation is provided" do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "expects error when no email is provided" do
      @user.email = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "expects error when no first name is provided" do
      @user.first_name = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "expects error when no last name is provided" do
      @user.last_name = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it "expects error when a an email is already in database" do
      @user2 = User.create(
        first_name: "testFirstName",
        last_name: "testLastName",
        email: "EMAIL@EMAIL.COM",
        password: "hello",
        password_confirmation: "hello",
      )
      expect(@user2).not_to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "expects error when password is below 4 characters" do
      @user.password = "hi"

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end

    describe '.authenticate_with_credentials' do

      it "authenticates when credentials are correct" do
        @user.save!
        user_auth = User.authenticate_with_credentials(@user.email, @user.password)

        expect(user_auth).to eq @user
      end

      it "doesn't authenticate when invalid email entry" do
        @user.save!
        user_auth = User.authenticate_with_credentials("test@test.com", @user.password)

        expect(user_auth).to eq nil
      end

      it "authenticates when email has whitespace" do
        @user.save!
        user_auth = User.authenticate_with_credentials("  email@email.com", @user.password)
        
        expect(user_auth.email).to eq @user.email
      end

      it "autheticates when email has wrong case (a or A)" do
        @user.save!
        user_auth = User.authenticate_with_credentials("eMaIl@EMAIL.CoM", @user.password)

        expect(user_auth.email).to eq @user.email
      end
    end

  end
end
