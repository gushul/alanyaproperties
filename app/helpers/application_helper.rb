# encoding: utf-8
module ApplicationHelper
  def menu_link(name, link)
    case "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
      when link
        content_tag :span, name
      when /#{link}/
        # <div class="div"><a class="act" href="" title="АКТИВНЫЙ ПУНКТ МЕНЮ, ССЫЛКА">УСЛУГИ</a><i class="nav_active"></i></div>
        content_tag :div, class: 'div' do
          link_to(name, link, class: 'act') +
              content_tag(:i, nil, class: 'nav_active')
        end
      else
        link_to name, link
    end
  end

  def number_to_currency(number, options = {})
    if (options.is_a? String)
      case options
        when 'euro'
          super(number, unit: "€", separator: ",", delimiter: " ", format: "%n %u", precision: 0)
      end
    else
      super(number, options)
    end
  end

  def map_mini_image(lat, lng)
    "http://maps.googleapis.com/maps/api/staticmap?center=#{lat},#{lng}&zoom=16&size=197x111&markers=icon:http://dl.dropbox.com/u/3489459/map_marker.png%7C#{lat},#{lng}&sensor=false"
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

  def readmore(text, length = 75)
    chars = text.mb_chars
    if chars.length > length
      chars.insert(length, ' <a href="#" class="read_more">Read more..</a><span class="read_more" style="display:none;">')
      chars << "</span>"
    end

    chars.html_safe
  end
end
