class AddSugImgToSuggestions < ActiveRecord::Migration
  def change

  	change_table(:suggestions) do |t|
  		t.attachment :sug_img
  	end

  end
end
