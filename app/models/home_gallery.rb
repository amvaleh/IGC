class HomeGallery < ActiveRecord::Base

  serialize :avatars, JSON
  mount_uploaders :avatars, AvatarUploader


end
