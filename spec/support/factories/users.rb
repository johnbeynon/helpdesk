FactoryGirl.define do
  factory :user do
    email { "bob#{rand(100000)}@boblaw.com" }
    password "password"
    password_confirmation "password"

    factory :admin do
      helpdesk_admin true
    end
  end
end
