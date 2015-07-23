class TeamMemberUploader < AssetUploader
  version :thumb do
    process resize_to_fill: [115, 137]
  end
end
