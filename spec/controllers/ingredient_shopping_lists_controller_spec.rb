require 'spec_helper'

describe IngredientShoppingListsController do

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
