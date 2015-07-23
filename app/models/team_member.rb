class TeamMember < ActiveRecord::Base
  attr_accessible :email, :languages, :name, :phone, :photo, :position, :photo_cache

  mount_uploader :photo, TeamMemberUploader
end
