class Park 
  attr_reader :full_name, :description, :direction_info, :standard_hours, :id
  def initialize(info)
    @full_name = info[:fullName]
    @description = info[:description]
    @direction_info = info[:directionsInfo]
    @standard_hours = info[:operatingHours][0][:standardHours]
    @id = info[:id]
  end
end