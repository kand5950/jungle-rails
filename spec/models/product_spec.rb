require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: "testCategory")
      @product = Product.new(
        name: "testProduct",
        price: 10,
        quantity: 7,
        category: @category,
      )
    end

    it "saves the model if 4 fields are present" do
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end


  end
end
