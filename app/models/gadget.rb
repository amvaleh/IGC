class Gadget < ActiveRecord::Base

  extend FriendlyId

  friendly_id :name, use: :slugged

  serialize :avatars, JSON

  mount_uploaders :avatars, AvatarUploader
end
