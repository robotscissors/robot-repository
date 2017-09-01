require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "guest user" do
    it "returns http success user not logged in" do
      get :index
      expect(response).to render_template(:index) 
    end
  end

  # describe "GET #about" do
  #   it "returns http success" do
  #     get :about
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
