class AddLatAndLonToSuggestions < ActiveRecord::Migration
  def change
  	change_table(:suggestions) do |t|
  		t.float :lon
  		t.float :lat
  	end
  end
end
