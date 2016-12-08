class CreateQualifications < ActiveRecord::Migration[5.0]
  def change
    create_table :qualifications do |t|
      t.string :school
      t.integer :grad_yr
      t.string :degree
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
