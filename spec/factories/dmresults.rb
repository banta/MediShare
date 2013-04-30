# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dmresult do
    rule "MyString"
    support 1.5
    total 1.5
    confidence 1.5
  end
end
