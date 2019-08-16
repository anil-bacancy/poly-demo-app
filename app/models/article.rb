class Article < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :likes, dependent: :destroy
end
