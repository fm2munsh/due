class CreateTableAdminsGroups < ActiveRecord::Migration
  	create_table :admins_groups, :id => false do |t|
	  t.integer :admin_id
	  t.integer :group_id
	end
end
