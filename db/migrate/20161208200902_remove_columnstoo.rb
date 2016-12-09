class RemoveColumnstoo < ActiveRecord::Migration[5.0]
  def change
  	remove_column :posts, :project_id
  	add_column :posts, :permalink, :string
  	add_index :posts, ["permalink"]
  end
end
