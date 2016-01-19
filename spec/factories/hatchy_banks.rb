FactoryGirl.define do
  factory :hatchy_bank, :class => 'Hatchy::Bank' do
    name "Bank"
    sequence(:code) { |n| "#{n} - #{Random.new_seed}" }
  end
end