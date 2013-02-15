class ContactPersonPhotoUploader < AssetUploader
  version :thumb do
    process resize_to_fill: [194, 170]
  end
end
