class Movie < ActiveRecord::Base
  has_many :acmos, dependent: :destroy
  belongs_to :user
  belongs_to :director
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :length
  validates_presence_of :description
  validates_numericality_of :director_id, :only_Integer => true
end
