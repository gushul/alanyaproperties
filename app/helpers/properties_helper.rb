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
    url = photo.try(:video) || photo.url
    img = image_tag(photo.send(style), argv)
    img += image_tag('play_video_mini.png', class: 'play_video') if photo.try(:video)
    link_to(img, url, title: argv[:title], class: "property_#{photo.try(:video) ? 'video' : 'photo'}")
  end

  def build_path(property, action = nil)
    [property.property_for, property].unshift(action)
  end
end
