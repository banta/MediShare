# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prescription_line do
    quantity "MyString"
    frequency 1
    time "MyString"
    period_no ""
    period "MyString"
  end
end
