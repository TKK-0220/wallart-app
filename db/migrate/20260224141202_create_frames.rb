class CreateFrames < ActiveRecord::Migration[7.2]
  def change
    create_table :frames do |t|
      t.string :name, null: false
      t.integer :short_side, null: false
      t.integer :long_side, null: false
      t.integer :direction, default: 0, null: false

      t.timestamps
    end
    add_index :frames, [ :name, :direction ], unique: true
  end
end
