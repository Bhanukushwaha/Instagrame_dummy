class Post < ApplicationRecord	
	attr_accessor :image  
	extend FriendlyId
    friendly_id :title, use: :slugged
	has_many :pictures, dependent: :destroy
    has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	belongs_to :user
end
