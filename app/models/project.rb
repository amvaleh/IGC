class Project < ActiveRecord::Base
	has_many :news
	serialize :avatars, JSON
	mount_uploaders :avatars, AvatarUploader
end
