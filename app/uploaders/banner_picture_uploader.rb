class BannerPictureUploader < AssetUploader
  version :thumb do
    process resize_to_fill: [216, 131]
  end

  version :top do
    process resize_to_fill: [487, 88]
  end

  version :left do
    process resize_to_fill: [215, 165]
  end
end
