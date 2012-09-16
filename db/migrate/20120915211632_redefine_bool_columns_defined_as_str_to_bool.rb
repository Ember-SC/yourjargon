class RedefineBoolColumnsDefinedAsStrToBool < ActiveRecord::Migration
  def up
    remove_column :organizations, :is_public
    remove_column :memberships, :can_modify
    remove_column :memberships, :is_owner
    add_column :organizations, :is_public, :boolean, :default => false
    add_column :memberships, :can_modify, :boolean, :default => false
    add_column :memberships, :is_owner, :boolean, :default => false

  end

  def down
    remove_column :organizations, :is_public
    remove_column :memberships, :can_modify
    remove_column :memberships, :is_owner
    add_column :organizations, :is_public, :string, :default => 'false'
    add_column :memberships, :can_modify, :string, :default => 'false'
    add_column :memberships, :is_owner, :string, :default => 'false'
  end
end
