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

  describe "States" do
    describe "should be new for a new ticket" do

    end
  end
end

