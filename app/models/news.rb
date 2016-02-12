class News < ActiveRecord::Base

	extend FriendlyId
	friendly_id :title, use: :slugged

	publishable :on => :publish_date


	scope :visible, -> {
		where(:published => true)
	}

	before_create :set_publish

	belongs_to :project
	serialize :avatars, JSON
	mount_uploaders :avatars, AvatarUploader


	def set_publish
		if self.published == true
			self.publish_date = self.created_at
		end
	end

end
