class CreateTypeCaches < ActiveRecord::Migration
  def change
    create_table :type_caches do |t|
      t.integer :urltype_id
      t.integer :color_id

      t.timestamps
    end
  end
end
