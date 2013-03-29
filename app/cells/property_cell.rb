class PropertyCell < Cell::Rails

  def sidebar(options = {})
    @position = options[:position]
    @for = options[:for]
    @banner = options[:banner]
    @city = options[:city]
    @type = options[:type]
    render
  end

end
