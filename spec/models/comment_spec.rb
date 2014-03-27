require 'spec_helper'
describe Helpdesk::Comment do
  it { should belong_to :author }
  it { should belong_to :ticket }

  describe "Mailers" do

    it "confirmation email is sent to the user" do
      comment = FactoryGirl.create(:comment_public)
      expect(all_email_addresses).to include comment.ticket.requester.email
    end
    if Helpdesk.send_confirmation_emails
      it "confirmation email is sent to the helpdesk" do
        FactoryGirl.create(:comment_public)
        expect(all_email_addresses).to include Helpdesk.email
      end
    else
      it "confirmation email is not sent to the helpdesk" do
        FactoryGirl.create(:comment_public)
        expect(all_email_addresses).not_to include Helpdesk.email
      end
    end

    it "if comment is note email is not sent" do
      ticket = FactoryGirl.create(:ticket)
      reset_email
      comment = FactoryGirl.create(:comment, ticket:ticket, public: false)
      expect(all_emails_sent_count).to eq 0
    end

  end

end
