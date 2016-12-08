class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :place
      t.string :position
      t.datetime :work_start
      t.datetime :work_end
      t.boolean :current_work, :default => false
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
