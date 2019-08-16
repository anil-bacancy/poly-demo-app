class Article < ApplicationRecord
  has_many :comments, as: :commentable
  acts_as_votable
end
