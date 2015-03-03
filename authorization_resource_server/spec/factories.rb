FactoryGirl.define do

  factory :user do |f|
    f.sequence(:login) { |n| "user#{n}" }
    password "password$123"
  end

  factory :client do |f|
    f.sequence(:client_id) { |n| "client#{n}" }
    f.sequence(:client_secret) { |n| "client_secret#{n}" }
    redirect_uri "http://redirect.uri/"
  end

  factory :token do
    client
    user
  end

  factory :expired_token, class: Token do
    client
    user
    created_at 20.minutes.ago
  end

end