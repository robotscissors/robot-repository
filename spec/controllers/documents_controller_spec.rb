require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do

  file_path = "#{fixture_path}/files/test.pdf"
  let(:my_file) { fixture_file_upload ("/files/test.pdf") }
  let(:test_user) {FactoryGirl.create(:user)}
  let(:my_title) {RandomData.random_sentence}
  let(:my_description) {RandomData.random_paragraph}
  let(:my_keywords) {"test"}
  #document = FactoryGirl.create(:document)
  let(:document) {Document.create!(title: my_title,
                                  description: my_description,
                                  keywords: my_keywords,
                                  document_file: my_file,
                                  user: test_user)}

  Document.reindex

  context "guest - not logged in" do
    describe "GET #index" do
      it "redirects to devise new session" do
        get :index
        expect(response).to redirect_to :action => :new, :controller => "devise/sessions"
      end
    end
    describe "GET #edit" do
      it "redirects to devise new session" do
        get :edit, id: document.id
        expect(response).to redirect_to :action => :new, :controller => "devise/sessions"
      end
    end
    describe "GET #new" do
      it "redirects to devise new session" do
        get :new
        expect(response).to redirect_to :action => :new, :controller => "devise/sessions"
      end
    end
    describe "GET #show" do
      it "redirects to devise new session" do
        get :show, id: document.id
        expect(response).to redirect_to :action => :new, :controller => "devise/sessions"
      end
    end
  end


  context "user logged in" do
    describe "GET #show" do
      before do
        test_user.confirm
        sign_in test_user
      end
      it "returns http success" do
        get :show, id: document.id
        expect(response).to have_http_status(:success)
      end
      it "renders the #show view" do
        get :show, id: document.id, user_id: test_user.id
        expect(response).to render_template :show
      end
    end

    describe "GET #index" do
      before do
        test_user.confirm
        sign_in test_user
      end
      it "returns http success" do
        get :index, search: "test"
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end
  end

end
