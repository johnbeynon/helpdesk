FactoryGirl.define do
  factory :ticket_type, class: Helpdesk::TicketType do
    position 1
    title "MyString"
  end
end
