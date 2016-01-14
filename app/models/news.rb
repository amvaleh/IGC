class News < ActiveRecord::Base
	belongs_to :project
	serialize :avatars, JSON
	mount_uploaders :avatars, AvatarUploader
end
