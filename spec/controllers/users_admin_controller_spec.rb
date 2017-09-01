require 'rails_helper'

RSpec.describe UserAdminController, type: :controller do

  let(:user) { User.create!(fullname: "Example User", email: "user@example.com",
                 password: "foobar", password_confirmation: "foobar")}

  describe "GET index" do
     it "renders the index template when logged in" do
       user.confirm
       sign_in user
       get :index
       expect(response).to render_template("user_admin/index")
     end
   end





end
