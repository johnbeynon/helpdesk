require 'spec_helper'

describe "tickets" do

  context "dashboard" do
    before do
      sign_in(FactoryGirl.create(:admin))
    end

    it "should show the admin dashboad" do
      visit admin_root_path
      expect(current_path).to eql(admin_root_path)
      expect(page).to have_content "www.example.com"
    end
  end
end
