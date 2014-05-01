class CreateUrlTypeRelationships < ActiveRecord::Migration
  def change
    create_table :url_type_relationships do |t|
      t.integer :url_id
      t.integer :urltype_id

      t.timestamps
    end
  end
end
