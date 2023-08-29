class Article < ApplicationRecord
  has_many :comments
  
  validates :title, presence: true
  #title must be present
  validates :body, presence:true, length: {minimum:5}
  #body must be present and at least 5 characters long
end
