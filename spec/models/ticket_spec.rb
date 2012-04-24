require 'spec_helper'
describe Helpdesk::Ticket do

  it { should accept_nested_attributes_for :comments }
  it { should belong_to :requester }
  it { should belong_to :assignee }
  it { should have_many :comments }
  it { should allow_mass_assignment_of :subject }
  it { should allow_mass_assignment_of :description }
  it { should allow_mass_assignment_of :requester_id }
  it { should allow_mass_assignment_of :assignee_id }
  it { should allow_mass_assignment_of :status }
  it { should allow_mass_assignment_of :issue_type }
  it { should allow_mass_assignment_of :comments_attributes }

  describe "Validations" do
    it { should validate_presence_of :description } 
  end

  describe "States" do
    describe "should be new for a new ticket" do

    end
  end
end

