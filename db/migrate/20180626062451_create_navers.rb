class CreateNavers < ActiveRecord::Migration[5.0]
  def change
    create_table :navers do |t|
      t.string :title
      t.text :description
      t.string :master_name
      
      t.timestamps
    end
  end
end
