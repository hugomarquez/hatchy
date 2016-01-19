FactoryGirl.define do
  factory :hatchy_country, :class => 'Hatchy::Country' do
    name "United States"
    code2 "US"
    code3 "USA"
    continent "NA"
    tld ".us"
    currency "USD"
    eu_member false
  end
end