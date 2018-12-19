class Author < ActiveRecord::Base
  has_many :posts

  validates :name, presence: :name, uniqueness: true
  validates :phone_number, { :length => {:is => 10} })
  
end
