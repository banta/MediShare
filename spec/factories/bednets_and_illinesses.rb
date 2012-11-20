# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bednets_and_illiness do
    county "MyString"
    under_net 1.5
    fever_or_malaria 1.5
    latitude "MyString"
    longitude "MyString"
  end
end
