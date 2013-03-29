class BannerCell < Cell::Rails
  helper ApplicationHelper

  def top(type = nil)
    query = Banner.active.top.random
    query = query.for(type) if type && type != 'reservation' && type != 'search'

    @banner = query.first

    render if @banner
  end

  def left
    @banner = Banner.active.left.random.first

    render if @banner
  end

end
