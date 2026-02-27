class RatioLogic
  def initialize(base_width, location_type)
    @base_width = base_width.to_f
    @location_type = location_type.to_s.strip.downcase
  end

  def call
    case @location_type
    when "wall"
      calculate_for_wall
    when "furniture"
      calculate_for_furniture
    else
      raise ArgumentError, "Invalid location_type: #{@location_type}"
    end
  end

  private

  def calculate_for_wall
    (@base_width/(1+1.618+1)*1.618).round
  end

  def calculate_for_furniture
    (@base_width * 0.618).round
  end
end
