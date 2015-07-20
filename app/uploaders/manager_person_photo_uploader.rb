# encoding: utf-8

class ManagerPersonPhotoUploader < AssetUploader

  version :thumb do
    process resize_to_fill: [70, -1]
  end
end
