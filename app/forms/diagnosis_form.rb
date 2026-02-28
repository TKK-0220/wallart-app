class DiagnosisForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :base_width, :integer
  attribute :location_type, :string
  attribute :direction, :string

  validates :base_width, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location_type, presence: true
end
