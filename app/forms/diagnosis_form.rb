class DiagnosisForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :base_width, :integer
  attribute :location_type, :string
  attribute :direction, :string

  validates :base_width, presence: true
  validate :validate_base_width_by_conditions

  # verticalの最小幅
  VERTICAL_MIN_WIDTHS = {
    "wall" => 199,
    "furniture" => 144
  }

  # horizontalの最小幅
  HORIZONTAL_MIN_WIDTHS = {
    "wall" => 284,
    "furniture" => 205
  }

  private

  def validate_base_width_by_conditions
    return if base_width.blank? || location_type.blank?

    min_width = minimum_width_for_current_condition
    return unless min_width
    return if base_width >= min_width

    errors.add(:base_width, "は#{min_width}mm以上の値を入力してください")
  end

  def minimum_width_for_current_condition
    widths = direction == "horizontal" ? HORIZONTAL_MIN_WIDTHS : VERTICAL_MIN_WIDTHS
    widths[location_type]
  end
end
