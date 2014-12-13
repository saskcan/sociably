# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    isbn "MyString"
    publisher_id ""
    edition "MyString"
    publish_date "2014-11-13"
    title "MyString"
  end
end
