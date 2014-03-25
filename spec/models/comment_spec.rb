require 'spec_helper'
describe Helpdesk::Comment do
  it { should belong_to :author }
  it { should belong_to :ticket }
end

