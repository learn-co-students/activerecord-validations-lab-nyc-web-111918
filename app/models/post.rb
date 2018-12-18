class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  CLICK_BAIT = [/Won't Believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i]
  def is_clickbait?
    if CLICK_BAIT.none? { |c| c.match title }
      errors.add(:title, "is not clickbait")
    end
  end
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
