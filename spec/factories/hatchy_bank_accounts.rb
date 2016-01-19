FactoryGirl.define do
  factory :hatchy_bank_account, :class => 'Hatchy::BankAccount' do
    account "Foo"
    account_digit "1"

    bank do 
        Hatchy::Bank.first || FactoryGirl.create(:hatchy_bank)
    end

    user do 
        Hatchy::User.first || FactoryGirl.create(:hatchy_user, :without_bank_data)
    end

  end
end