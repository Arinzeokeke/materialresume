class CreatePosts < ActiveRecord::Migration[5.0]
	def change
		create_table :posts do |t|
			t.string :first_name
			t.string :last_name 
			t.string :email
			t.integer :recommendation_id
			t.integer :qualification_id
			t.integer :experience_id
			t.integer :project_id

			t.timestamps
		end

		add_index("posts", "recommendation_id" )
		add_index("posts", "qualification_id" )
		add_index("posts", "experience_id" )
		add_index("posts", "project_id" )

	end
end
