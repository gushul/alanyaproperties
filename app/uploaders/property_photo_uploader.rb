class PropertyPhotoUploader < AssetUploader
  version :thumb do
    process resize_to_fill: [216, 131]
  end

  version :thumb2 do
    process resize_to_fill: [218, 171]
  end

  version :big do
    process resize_to_fill: [450, 250]
  end


  def video?
    false
  end
end
