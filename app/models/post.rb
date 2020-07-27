class Post < ActiveRecord::Base
  validates :title, {presence: true}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

  def clickbait?
    errorcheck=false
    if title
      ["Won't Believe", "Secret", "Top", "Guess"].each do |word|
        if title.include?(word)
          errorcheck=true
        end
      end
    end
    if errorcheck==false
      errors.add(:title, "must be clickbait")
    end
  end
end
