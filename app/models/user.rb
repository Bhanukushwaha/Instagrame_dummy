class User < ApplicationRecord
   validates :first_name, :last_name, :image, presence: true
   mount_uploader :image, AvatarUploader
   has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :comments, dependent: :destroy
   has_many :posts, dependent: :destroy
    after_create :set_username
  private 
  def set_username
   user_na = self.email.split('@').first
   self.user_name = user_na
   self.save
  end 
end
