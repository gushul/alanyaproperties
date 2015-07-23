class TeamMemberUploader < AssetUploader

  version :thumb do
    process resize_to_fill: [70, -1]
  end
end
