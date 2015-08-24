class Movie < ActiveRecord::Base
  has_many :acmos
  belongs_to :user
  belongs_to :director
  has_many :comments
  has_many :favorites
end

