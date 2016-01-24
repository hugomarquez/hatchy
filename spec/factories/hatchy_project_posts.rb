FactoryGirl.define do
  factory :hatchy_project_post, :class => 'Hatchy::ProjectPost' do
  	association :project, factory: :hatchy_project
  	association :user, factory: :hatchy_user
  	title "Example"
  	content "This is an example post!!"
  end
end
