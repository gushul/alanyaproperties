module ApplicationHelper
  def menu_link(name, link)
    link_to_unless_current name, link do
      content_tag('span', name)
    end
  end
end
