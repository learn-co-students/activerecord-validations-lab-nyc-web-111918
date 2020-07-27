require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    valid_strs = [/won't believe/i, /secret/i, /top [0.100]/i, /guess/i]
    unless valid_strs.any?{|str| str.match(title)}
      errors.add(:title, "Invalid title")
    end
  end

end
