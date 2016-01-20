FactoryGirl.define do
  factory :hatchy_contribution, :class => 'Hatchy::Contribution' do
  	association :country, factory: :hatchy_country
  	association :user, factory: :hatchy_user
  	association :project, factory: :hatchy_project
  	association :reward, factory: :hatchy_reward
  	value 10.0
  	status "pending"
  	step "reward_select"
  	name "owner contribution"
  	email "test@mail.com"
  	document "document123"
  	address_street "Street Address"
    address_number "123"
    address_city "Street City"
    address_state "Street State"
    address_zip "zip123"
  	address_phone "12231233"
  	ip_address "127.0.0"
  	card_type "Visa"
  	card_expires_on Time.now
  	anonymous false
  	notified_when_finish true

    trait :without_project do
      project { nil }
    end

    trait :without_user do 
      user { nil }
    end

    trait :without_reward do 
      reward { nil }
    end

  end
end
