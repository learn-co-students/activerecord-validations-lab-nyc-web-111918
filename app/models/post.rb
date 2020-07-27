class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

  validate :clickbait?

  def clickbait_array
    ["Won't", "Believe", "Secret", "Guess", "Top"]
  end

  def clickbait?
    #use #match 
    if self.title && self.title.split.none? { |w| clickbait_array.include?(w)}
      errors.add(:title, "must be clickbait")
    end
  end



end
