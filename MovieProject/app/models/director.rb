class Director < ActiveRecord::Base
  has_many :movies, dependent: :destroy
  validates_presence_of :name
  #  validates_presence_of :bio  
  has_attached_file :image, styles: { medium: "200x200#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
