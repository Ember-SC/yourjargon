class CreateOrganizations < ActiveRecord::Migration
  def up
    create_table :organizations do |t|
      t.string :name
      t.string :is_public
    end
  end

  def down
    drop_table :organizations
  end
end
