class SliderPhotoUploader < AssetUploader
  version :thumb do
    process resize_to_fill: [200, 200]
  end
  version :big do
    process resize_to_fill: [956, 426]
  end
end
