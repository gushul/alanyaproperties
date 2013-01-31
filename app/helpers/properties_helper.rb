module PropertiesHelper
  def property_path(property)
    url_for [property.property_for, property]
  end
end
