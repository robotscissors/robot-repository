require "rails_helper"

RSpec.describe Notification, type: :mailer do
  describe "new_document" do
    let(:mail) { Notification.new_document }

    it "renders the headers" do
      expect(mail.subject).to eq("New document")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
