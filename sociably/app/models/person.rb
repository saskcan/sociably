class Person < ActiveRecord::Base
	has_many :contributions
	has_many :roles, through: :contributions

  def full_name
    first_name + " " + middle_name + " " + last_name
  end
end
