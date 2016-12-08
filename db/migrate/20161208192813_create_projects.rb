class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
        t.string :name
	    t.integer :project_yr
	    t.string :description
	    t.references :post, foreign_key: true
	    t.timestamps
    end
  end
end
