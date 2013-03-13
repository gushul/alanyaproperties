class SliderPhotoUploader < AssetUploader
  version :thumb do
    process resize_to_fill: [200, 200]
  end
  version :big do
    process resize_to_fill: [958, 426]
  end
  version :small do
    process resize_to_fill: [708, 258]
  end
end
