class Picture < ApplicationRecord
	mount_uploader :image, AvatarUploader
	belongs_to :post
end
