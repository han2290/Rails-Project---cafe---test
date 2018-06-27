class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :contents
      t.integer :user_id
      t.integer :naver_id
            
      
      t.timestamps
    end
  end
end
