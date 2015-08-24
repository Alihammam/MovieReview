class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates_presence_of :name
  validates_confirmation_of :email
  validates_length_of :password, :in => 8..20

  has_attached_file :image, styles: { medium: "200x200#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
