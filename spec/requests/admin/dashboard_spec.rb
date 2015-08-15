require 'spec_helper'

describe "dashboard" do

  context "a logged in user" do

    before do
      sign_in(FactoryGirl.create(:user))
    end

    it "should not have access" do
      visit admin_root_path
      expect(current_path).not_to eql(admin_root_path)
    end

  end

  context "a logged in admin user" do
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
