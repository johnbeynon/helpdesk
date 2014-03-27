FactoryGirl.define do
  factory :comment, class: Helpdesk::Comment do
    comment "MyText"
    association :author, factory: :user
    association :ticket, factory: :ticket
    factory :comment_public do
      public true
    end
  end
end
