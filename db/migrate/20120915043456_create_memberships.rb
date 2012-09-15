class CreateMemberships < ActiveRecord::Migration
  def up
    create_table :memberships do |t|
      t.references :user
      t.references :organization
      t.string :can_modify
      t.string :is_owner
    end
  end

  def down
  end
end
