class Actor < ActiveRecord::Base
  has_many :acmos, dependent: :destroy
  validates_presence_of :name
#  validates_presence_of :bio
end
