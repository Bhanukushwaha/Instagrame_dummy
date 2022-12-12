class Post < ApplicationRecord	
	attr_accessor :image
	has_many :pictures
end
