class Frame < ApplicationRecord
    enum direction: { vertical: 0, horizontal: 1 }

    validates :name, presence: true
    validates :short_side, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :long_side, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :direction, presence: true
end
