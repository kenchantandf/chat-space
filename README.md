class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.string :image, null: false
      t.integer :group_id, null: false
      t.integer :user_id, null:false
      t.timestamps null: false
    end
  end
end
