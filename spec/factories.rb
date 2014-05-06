FactoryGirl.define do ||
  factory :user do
    email "michael@example.com"
    password "2940425"
    password_confirmation "2940425"
    confirmed_at Time.now
    confirmation_sent_at Time.now
  end

  factory :category do
    name "Lorem Ipsum"
  end

  factory :information do
    title "Lorem Ipsum"
    content "Lorem Ipsum"
    category
  end
end
