class CreatePosts < ActiveRecord::Migration[5.0]
	def change
		create_table :posts do |t|
			t.string :first_name
			t.string :last_name 
			t.string :email
			t.references :recommendation, foreign_key: true
			t.references :qualification, foreign_key: true
			t.references :experience, foreign_key: true
			t.references :project, foreign_key: true
			t.json 

			t.timestamps
		end
	end
end
