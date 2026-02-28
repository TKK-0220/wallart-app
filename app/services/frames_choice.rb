class FramesChoice
    def initialize(recommended_size, direction)
      @recommended_size=recommended_size
      @direction=direction
    end

    def call
        case @direction
        when "vertical"
            find_by_short_side
        when "horizontal"
            find_by_long_side
        else
            no_specified
        end
    end

    private

    def find_by_short_side
      Frame.where(direction: @direction).order(Arel.sql("ABS(short_side - #{@recommended_size})")).limit(3)
    end

    def find_by_long_side
       Frame.where(direction: @direction).order(Arel.sql("ABS(long_side - #{@recommended_size})")).limit(3).uniq
    end

    def no_specified
        vertical = Frame.order(Arel.sql("ABS(short_side - #{@recommended_size})")).limit(5)
        horizontal = Frame.order(Arel.sql("ABS(long_side - #{@recommended_size})")).limit(5)
        (vertical+horizontal).uniq.first(5)
    end
end
