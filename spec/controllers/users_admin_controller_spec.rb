require 'rails_helper'

RSpec.describe UserAdminController, type: :controller do

  user = FactoryGirl.create(:user)

  describe "GET index" do
     it "renders the index template when logged in" do
       user.confirm
       sign_in user
       get :index
       expect(response).to render_template("user_admin/index")
     end

     it "renders the login page when user not logged in" do
       user.confirm
       get :index
       expect(response).to redirect_to :action => :new, :controller => "devise/sessions"
     end
   end





end
