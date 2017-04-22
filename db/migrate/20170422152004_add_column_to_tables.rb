class AddColumnToTables < ActiveRecord::Migration[5.0]
  def change
  	add_column :qualifications, :detail, :text
  	add_column :experiences, :detail, :text



  end
end
