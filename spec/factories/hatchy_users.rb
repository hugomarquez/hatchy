FactoryGirl.define do
  factory :hatchy_user, :class => 'Hatchy::User' do
    association :bank_account, factory: :hatchy_bank_account
    association :country, factory: :hatchy_country
    profile_img File.open("#{ENGINE_RAILS_ROOT}/spec/support/hatchy/ruby.png")
    cover_img File.open("#{ENGINE_RAILS_ROOT}/spec/support/hatchy/ruby.png")
    facebook_link "http://www.fb.com"
    twitter_link "http://www.tw.com"
    other_link "http://www.google.com"
    first_name "Foo"
    last_name "Bar"
    password "123"
    about "this is the about of Foo Bar"
    address_street "Street Address"
    address_number "123"
    address_city "Street City"
    address_state "Street State"
    address_zip "zip123"
    document "document123"
    phone "01800"
    mobile "044800"
    sequence(:email) { |n| "#{Random.new_seed}@#{n}.com" }
    sequence(:username) { |n| "#{Random.new_seed}#{n}" }

    trait :without_bank_data do
      bank_account { nil }
    end
  end

end