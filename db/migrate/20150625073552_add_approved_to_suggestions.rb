class AddApprovedToSuggestions < ActiveRecord::Migration
  def change
  	add_column :suggestions, :approved, :boolean, :default => false
  end
end
 