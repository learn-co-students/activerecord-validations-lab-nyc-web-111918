class Post < ActiveRecord::Base
  belongs_to :author

  validates :title, presence: :title
  validates :content, { :length => {:minimum => 250} })
  validates :summary, { :length => {:maximum => 250} })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
  validate :clickbait_title, inclusion: { in: %w(Won't Believe Secret Top Guess), message: "%{value} is not valid title"}

  def clickbait_title
    if title.present? && title.include?("Won't", "Believe", "Secret", "Top", "Guess")
      errors.add(:title, "has to include the clickbait words")
    end
  end

end # end of Post class
