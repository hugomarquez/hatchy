FactoryGirl.define do
  factory :hatchy_project, :class => 'Hatchy::Project' do
    project_img File.open("#{ENGINE_RAILS_ROOT}/spec/support/hatchy/ruby.png")
    city "City"
    sequence(:name) { |n| "#{n}-#{Random.new_seed}" }
    headline "Headline"
    about "About"
    budget "Budget"
    video_url "https://www.youtube.com/watch?v=piCKXS--YcQ"
    short_url "my_project"
    goal 2000
    online_days 60
    recommended false
    status "draft"
    
    category do
      Hatchy::Category.first || FactoryGirl.create(:hatchy_category)
    end

    user do 
      Hatchy::User.first || FactoryGirl.create(:hatchy_user, :without_bank_data)
    end

    trait :without_category do
      category { nil }
    end

    trait :without_user do 
      user { nil }
    end

  end
end