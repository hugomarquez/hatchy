FactoryGirl.define do
  factory :hatchy_reward, :class => 'Hatchy::Reward' do
  	association :project, factory: :hatchy_project
  	min_value 10.0
  	max_contributions
  	description "Test reward"
  	row_order 1
  	deliver_at
  end
end
