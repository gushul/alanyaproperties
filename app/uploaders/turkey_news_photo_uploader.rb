class TurkeyNewsPhotoUploader < AssetUploader
  version :thumb do
    process resize_to_fill: [205, 136]
  end

  version :map do
    process resize_to_fill: [710, 288]
  end
end
