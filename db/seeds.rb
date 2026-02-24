# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
if Frame.count > 0
  puts "-----フレームは既に存在します。シードをスキップします。-----"
  exit
end

puts "-------フレームデータを作成します--------"

# A判
Frame.create!(name: 'A4', short_side: 210, long_side: 297, direction: :vertical)
Frame.create!(name: 'A4', short_side: 210, long_side: 297, direction: :horizontal)

Frame.create!(name: 'A3', short_side: 297, long_side: 420, direction: :vertical)
Frame.create!(name: 'A3', short_side: 297, long_side: 420, direction: :horizontal)

Frame.create!(name: 'A2', short_side: 420, long_side: 594, direction: :vertical)
Frame.create!(name: 'A2', short_side: 420, long_side: 594, direction: :horizontal)

Frame.create!(name: 'A1', short_side: 594, long_side: 841, direction: :vertical)
Frame.create!(name: 'A1', short_side: 594, long_side: 841, direction: :horizontal)

# B判
Frame.create!(name: 'B3', short_side: 364, long_side: 515, direction: :vertical)
Frame.create!(name: 'B3', short_side: 364, long_side: 515, direction: :horizontal)

Frame.create!(name: 'B2', short_side: 515, long_side: 728, direction: :vertical)
Frame.create!(name: 'B2', short_side: 515, long_side: 728, direction: :horizontal)

Frame.create!(name: 'B1', short_side: 728, long_side: 1030, direction: :vertical)
Frame.create!(name: 'B1', short_side: 728, long_side: 1030, direction: :horizontal)

# 写真判
Frame.create!(name: 'L判', short_side: 89, long_side: 127, direction: :vertical)
Frame.create!(name: 'L判', short_side: 89, long_side: 127, direction: :horizontal)

Frame.create!(name: '2L判', short_side: 127, long_side: 178, direction: :vertical)
Frame.create!(name: '2L判', short_side: 127, long_side: 178, direction: :horizontal)

Frame.create!(name: '六切', short_side: 203, long_side: 254, direction: :vertical)
Frame.create!(name: '六切', short_side: 203, long_side: 254, direction: :horizontal)

Frame.create!(name: '四切', short_side: 254, long_side: 305, direction: :vertical)
Frame.create!(name: '四切', short_side: 254, long_side: 305, direction: :horizontal)

Frame.create!(name: 'ワイド四切', short_side: 254, long_side: 366, direction: :vertical)
Frame.create!(name: 'ワイド四切', short_side: 254, long_side: 366, direction: :horizontal)

# 油彩判
Frame.create!(name: 'P10', short_side: 410, long_side: 530, direction: :vertical)
Frame.create!(name: 'P10', short_side: 410, long_side: 530, direction: :horizontal)

Frame.create!(name: 'P20', short_side: 530, long_side: 727, direction: :vertical)
Frame.create!(name: 'P20', short_side: 530, long_side: 727, direction: :horizontal)

Frame.create!(name: 'P30', short_side: 652, long_side: 910, direction: :vertical)
Frame.create!(name: 'P30', short_side: 652, long_side: 910, direction: :horizontal)

# 油絵サイズ（F号）
Frame.create!(name: 'F10', short_side: 455, long_side: 530, direction: :vertical)
Frame.create!(name: 'F10', short_side: 455, long_side: 530, direction: :horizontal)

Frame.create!(name: 'F20', short_side: 606, long_side: 727, direction: :vertical)
Frame.create!(name: 'F20', short_side: 606, long_side: 727, direction: :horizontal)

Frame.create!(name: 'F30', short_side: 727, long_side: 910, direction: :vertical)
Frame.create!(name: 'F30', short_side: 727, long_side: 910, direction: :horizontal)

puts "-------#{Frame.count}件のフレームデータを作成しました--------"
