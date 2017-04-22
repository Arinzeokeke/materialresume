class CreateOthers < ActiveRecord::Migration[5.0]
  def change
    create_table :others do |t|
      t.string :title
      t.text :detail
      t.belongs_to :post, foreign_key: true

      t.timestamps
    end
  end
end
