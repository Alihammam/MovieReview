class Movie < ActiveRecord::Base
  has_many :acmos, dependent: :destroy
  belongs_to :user
  belongs_to :director
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ratings,dependent: :destroy

  validates_presence_of :title
  validates_presence_of :length
  validates_presence_of :description
  validates_numericality_of :director_id, :only_Integer => true

  has_attached_file :image, styles: { medium: "400x600#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
