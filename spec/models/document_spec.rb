require 'rails_helper'

RSpec.describe Document, type: :model do
  file_path = "#{fixture_path}/files/test.pdf"
  puts file_path
  let(:my_file) { fixture_file_upload ("/files/test.pdf") }
  let(:test_user) {FactoryGirl.create(:user)}
  let(:my_title) {RandomData.random_sentence}
  let(:my_description) {RandomData.random_paragraph}
  let(:my_keywords) {RandomData.random_sentence}
  #document = FactoryGirl.create(:document)
  let(:document) {Document.create!(title: my_title,
                                  description: my_description,
                                  keywords: my_keywords,
                                  document_file: my_file,
                                  user: test_user)}

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:document_file) }
  it { is_expected.to validate_presence_of(:user_id) }

  describe "attributes" do
    it "has title and body attributes" do
      expect(document).to have_attributes(title: document.title, description: document.description, user_id: document.user_id)
    end
    it "has file document attributes from Paperclip after loaded" do
      expect(document).to have_attributes(document_file_file_name: document.document_file_file_name,
                                          document_file_content_type: document.document_file_content_type,
                                          document_file_file_size: document.document_file_file_size,
                                          document_file_updated_at: document.document_file_updated_at)
    end
    it "has full text stripped from the PDF and inserted in field" do
      expect(document).to have_attributes(file_full_text: document.file_full_text)
      expect(document.file_full_text).to_not be_nil
    end
  end
end
