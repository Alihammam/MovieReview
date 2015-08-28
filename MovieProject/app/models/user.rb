class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, styles: { medium: "400x600#", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ratings, dependent: :destroy




end