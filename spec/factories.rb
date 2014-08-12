FactoryGirl.define do

  factory :user do
    id 1
    name "Jake"
  end

  factory :recipient, class: User do
    id 2
    name "Maya"
  end

  factory :message do
    user_id 1
    recipient_id 2
    content 'Hello, this is good!'
  end

  factory :address do
    city "New York"
    state "NY"
    zip 11222
  end

end