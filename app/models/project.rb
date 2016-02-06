class Project < ActiveRecord::Base
	has_many :news

	serialize :avatars, JSON
	mount_uploaders :avatars, AvatarUploader




	# completed projects status = 0
	# on going projects status = 1



end
