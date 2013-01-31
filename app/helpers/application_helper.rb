# encoding: utf-8
module ApplicationHelper
  def menu_link(name, link)
    link_to_unless_current name, link do
      content_tag('span', name)
    end
  end

  def number_to_currency(number, options = {})
    if(options.is_a? String)
      case options
      when 'euro'
        super(number, unit: "€", separator: ",", delimiter: " ", format: "%n %u", precision: 0)
      end
    else
      super(number, options)
    end
  end
end
