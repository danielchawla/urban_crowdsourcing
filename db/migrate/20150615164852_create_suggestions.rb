class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :user_id
      t.string :overview
      t.string :description
      t.string :location
    end
  end
end
