module PropertiesHelper
  def property_path(property)
    polymorphic_path build_path(property)
  end
  alias :property_url :property_path

  def map_property_path(property)
    polymorphic_path build_path(property, :map)
  end

  def offer_property_path(property)
    polymorphic_path build_path(property, :offer)
  end

  def photo_tag(photo, argv)
    style = argv.delete(:style) || :small
    url = photo.video? ? photo.video : photo.url
    img = image_tag(photo.send(style), argv)
    img += image_tag('play_video_mini.png', class: 'play_video') if photo.video?
    link_to(img, url, title: argv[:title], class: "property_#{photo.video? ? 'video' : 'photo'}")
  end

  def build_path(property, action = nil)
    [property.property_for, property].unshift(action)
  end

  def build_title_with_page(title = build_title)
    page = params[:page].to_i
    page > 1 ? t('property.title.with_page', page: page, title: title) : title
  end

  def build_title(options = params)
    t 'property.title.pattern',
      for: t("property.title.for.#{options[:property_for]}"),
      type: options[:property_type].blank? ? t('property.title.type.blank') : options[:property_type].map {|type| t("property.title.type.#{type}") }.uniq.join(', '),
      city: options[:city_id].blank? ? t('property.title.city.blank') : City.find(options[:city_id]).map {|city| city.name_case3 }.join(", "),
      suffix: options[:to_sea].blank? ? '' : " " << options[:to_sea].map {|dist| t("property.title.to_sea.#{dist}") }.reject(&:blank?).join(', ')
  end
end
