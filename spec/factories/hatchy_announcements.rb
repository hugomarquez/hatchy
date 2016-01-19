FactoryGirl.define do
  factory :hatchy_announcement, :class => 'Hatchy::Announcement' do
    message "This is a message!"
    starts_at Time.now
    ends_at 1.hour.from_now
  end
end