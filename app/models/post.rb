class MyValidator < ActiveModel::Validator

  def validate(post)
    str = post.title
    if str != nil && ["Won't Believe", "Secret","Top[0..10]", "Guess"].any? {|word| str.include?(word)} == false
      post.errors[:title] << "This is not clickbait."
    end
  end
end



class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Bowling Ball Fiction Non-Fiction)}

  include ActiveModel::Validations
  validates_with MyValidator
end
