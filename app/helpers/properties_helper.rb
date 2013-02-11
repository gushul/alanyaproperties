module PropertiesHelper
  def property_path(property)
    url_for [property.property_for, property]
  end

  def photo_tag(photo, argv)
    style = argv.delete(:style) || :small
    link_to(image_tag(photo.send(style), argv), photo.url, title: argv[:title], class: "property_photo")
  end
end
