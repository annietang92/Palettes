class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :url_id
      t.integer :color_id

      t.timestamps
    end
  end
end
