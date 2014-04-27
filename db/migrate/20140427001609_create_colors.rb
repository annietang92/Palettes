class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :hex
      t.integer :r
      t.integer :g 
      t.integer :b
      t.string :hue
      t.integer :val
      t.integer :sat

      t.timestamps
    end
  end
end
