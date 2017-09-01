require 'rails_helper'


RSpec.describe User, type: :model do

  before do
      @user = User.create!(fullname: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  it { is_expected.to have_many(:documents) }

    it "responds to create" do
      expect(@user.fullname).to eq("Example User")
      expect(@user.email).to eq("user@example.com")
    end

    it "should have a default role of standard" do
      expect(@user.role).not_to be_nil
      expect(@user.role).to eq("standard")
    end

end
