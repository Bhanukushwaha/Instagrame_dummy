class Post < ApplicationRecord	
	attr_accessor :image
	has_many :pictures
    has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :title, presence: true

end
