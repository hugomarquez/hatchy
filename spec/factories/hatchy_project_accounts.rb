FactoryGirl.define do
  factory :hatchy_project_account, :class => 'Hatchy::ProjectAccount' do
    account_type "Legal Person"
    email "test@mail.com"
    phone "8111111"
    account "1234-1234-12"
    account_digit "23-12"
    owner_name "Foo Bar"
    owner_document "123FBar"
    address_street "Street"
    address_number "123321"
    address_city "City"
    address_state "State"
    address_zip "Zip321"

    trait :without_project do
      project { nil }
    end

    trait :without_bank do
      bank { nil }
    end

    project do
      Hatchy::Project.first || FactoryGirl.create(:hatchy_project)
    end

    bank do
      Hatchy::Bank.first || FactoryGirl.create(:hatchy_bank)
    end

  end
end