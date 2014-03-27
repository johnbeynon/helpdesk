require 'spec_helper'
describe Helpdesk::Ticket do

  it { should accept_nested_attributes_for :comments }
  it { should belong_to :requester }
  it { should belong_to :assignee }
  it { should have_many :comments }
  it { should belong_to :ticket_type }


  describe "Validations" do
    it { should validate_presence_of :description }
  end

  describe "Status" do
    it "should be :new for a new ticket" do
      FactoryGirl.create(:ticket).status.should == :new
    end
  end

  describe "Mailers" do

    it "confirmation email is sent to the user" do
      ticket = FactoryGirl.create(:ticket)
      expect(all_email_addresses).to include ticket.requester.email
    end
    if Helpdesk.send_confirmation_emails
      it "confirmation email is sent to the helpdesk" do
        FactoryGirl.create(:ticket)
        expect(all_email_addresses).to include Helpdesk.email
      end
    else
      it "confirmation email is not sent to the helpdesk" do
        FactoryGirl.create(:ticket)
        expect(all_email_addresses).not_to include Helpdesk.email
      end
    end
  end
end
