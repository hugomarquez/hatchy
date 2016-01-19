FactoryGirl.define do
  factory :hatchy_category, :class => 'Hatchy::Category' do
    sequence(:name) { |n| "Name #{Random.new_seed}" }
  end
end