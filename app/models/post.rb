class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity?

  CLICKBAIT =[
    /Won't Believe/i,
     /Secret/i,
     /Top [0-9]*/i,
     /Guess/i
  ]

  def clickbaity?
    CLICKBAIT.none? do |words|
      return true if words.match(title)
      errors.add(:title, "Not ClickBaity")
    end
  end
end
