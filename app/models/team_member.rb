class TeamMember < ActiveRecord::Base
  attr_accessible :email, :languages, :name, :phone, :position, :skype, :photo, :photo_cache

  mount_uploader :photo, TeamMemberUploader
end
