# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    names "MyString"
    identification_number "MyString"
    gender "MyString"
    address "MyString"
    town "MyString"
    location "MyString"
    phone "MyString"
    country "MyString"
    occupation "MyString"
    civil_status "MyString"
    date_of_birth "2013-02-26"
  end
end
