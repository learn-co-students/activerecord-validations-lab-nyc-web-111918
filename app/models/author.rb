class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, length: {is: 10}
end
# All authors have a name
# No two authors have the same name
# Author phone numbers are exactly ten digits
# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters
# Post category is either Fiction or Non-Fiction
# This step requires an inclusion validator,
# which was not outlined in the README lesson.
# You'll need to refer to the Rails guide to
# look up how to use it.
