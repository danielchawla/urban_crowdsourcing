class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :suggestion_id
      	t.string :user_id
      	t.string :text
      	t.timestamps null: false
    end
  end
end
