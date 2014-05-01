class CreateTopCaches < ActiveRecord::Migration
  def change
    create_table :top_caches do |t|
      t.integer :color_id

      t.timestamps
    end
  end
end
