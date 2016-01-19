FactoryGirl.define do
  factory :hatchy_bank, :class => 'Hatchy::Bank' do
    sequence(:name) { |n| "bank-#{n}" }
    sequence(:code) { |n| "code-#{n}" }
  end
end