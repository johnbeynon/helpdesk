FactoryGirl.define do
  factory :ticket, class: Helpdesk::Ticket do
    subject "MyString"
    description "MyString"
    association :requester, factory: :user
    association :ticket_type, factory: :ticket_type
  end
end
