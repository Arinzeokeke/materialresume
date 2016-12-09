class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :posts, :qualification_id
  	remove_column :posts, :recommendation_id
  	remove_column :posts, :experience_id

  end
end
