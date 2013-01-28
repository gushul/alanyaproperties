class CityCoverUploader < AssetUploader
  version :thumb do
    process :resize_to_fill => [120, 105]
  end

  version :cover do
    process :resize_to_fit => [292, nil]
  end
end
