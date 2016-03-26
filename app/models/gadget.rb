class Gadget < ActiveRecord::Base

  extend FriendlyId

  friendly_id :name, use: :slugged

  serialize :avatars, JSON
  validates_presence_of [:name , :arabic_name]
  
  mount_uploaders :avatars, AvatarUploader
end
