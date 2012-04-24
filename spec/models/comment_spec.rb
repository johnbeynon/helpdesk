require 'spec_helper'
describe Helpdesk::Comment do
  it { should belong_to :author }
  it { should belong_to :ticket }
  it { should allow_mass_assignment_of :author_id }
  it { should allow_mass_assignment_of :ticket_id }
  it { should allow_mass_assignment_of :comment }
  it { should allow_mass_assignment_of :public }


end

