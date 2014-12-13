# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chapter do
    book_id ""
    title "MyString"
    number ""
    start_page ""
    description "MyText"
  end
end
