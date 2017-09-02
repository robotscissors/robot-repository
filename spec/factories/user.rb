FactoryGirl.define do
   pw = RandomData.random_sentence

   factory :user do
     fullname RandomData.random_name
     #sequence(:email){|n| "user#{n}@factory.com" }
     email RandomData.random_email
     password pw
     password_confirmation pw
   end
end
