FactoryGirl.define do
  factory :hatchy_category, :class => 'Hatchy::Category' do
    sequence(:name) { |n| "#{n}-#{Random.new_seed}" }
  end
end