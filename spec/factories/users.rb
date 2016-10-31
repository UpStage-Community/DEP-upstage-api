FactoryGirl.define do
    factory :user do
        email { FFaker::Internet.email }
        password "testpass"
        password_confirmation "testpass"
    end
end
