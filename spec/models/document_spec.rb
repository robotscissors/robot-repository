require 'rails_helper'

RSpec.describe Document, type: :model do

  let(:document) { Document.last }

  describe "attributes" do
    it "has title and body attributes" do
      expect(document).to respond_to(:title)
    end
  end
end
