class AddColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :category, :string
  end
end
