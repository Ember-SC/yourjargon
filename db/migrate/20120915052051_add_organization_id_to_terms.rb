class AddOrganizationIdToTerms < ActiveRecord::Migration
  def up
    change_table :terms do |t|
      t.references :organization
    end
  end
  def down
    remove_column :terms, :organization_id
  end
end
