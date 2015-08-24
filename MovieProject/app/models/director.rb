class Director < ActiveRecord::Base
  has_many :movies, dependent: :destroy
  validates_presence_of :name
  #  validates_presence_of :bio  

end
