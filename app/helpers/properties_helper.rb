module PropertiesHelper
  def property_path(property)
    url_for build_path(property)
  end

  def map_property_path(property)
    url_for build_path(property, :map)
  end

  def offer_property_path(property)
    url_for build_path(property, :offer)
  end

  def photo_tag(photo, argv)
    style = argv.delete(:style) || :small
    link_to(image_tag(photo.send(style), argv), photo.url, title: argv[:title], class: "property_photo")
  end

  def build_path(property, action = nil)
    [property.property_for, property].unshift(action)
  end
end
