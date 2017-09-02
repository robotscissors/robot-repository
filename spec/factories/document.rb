require 'spec_helper'

FactoryGirl.define do
  factory :document do
    #let(:file) { fixture_file_upload ("#{fixture_path}/files/test.pdf") }
    title RandomData.random_sentence
    description RandomData.random_paragraph
    keywords RandomData.random_sentence
    document_file fixture_file_upload ("#{fixture_path}/files/test.pdf")
    user
  end
end
