class CreateUrltypes < ActiveRecord::Migration
  def change
    create_table :urltypes do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
