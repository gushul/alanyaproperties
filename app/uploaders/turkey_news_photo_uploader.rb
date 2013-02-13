class TurkeyNewsPhotoUploader < AssetUploader
  version :thumb do
    process resize_to_fill: [205, 136]
  end
end
