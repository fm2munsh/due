class CreateJoinTableGroupsUsers < ActiveRecord::Migration
  create_table :groups_users, :id => false do |t|
	  t.integer :group_id
	  t.integer :user_id
	end
end
