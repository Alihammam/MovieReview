class Rating < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates_numericality_of :rate, :only_Integer => true
end
