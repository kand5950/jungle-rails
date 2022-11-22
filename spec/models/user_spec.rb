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
  end
end
