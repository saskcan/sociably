# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contributor do
    person_id ""
    role_id ""
    contributable_id 1
    contributable_type "MyString"
  end
end
