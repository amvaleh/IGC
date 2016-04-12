class Project < ActiveRecord::Base
	has_many :news

	extend FriendlyId
	friendly_id :title, use: :slugged

	serialize :avatars, JSON
	mount_uploaders :avatars, AvatarUploader

	# validates_presence_of: [:status , :project_type, :client_name , :




	# completed projects status = 0
	# on going projects status = 1



end
