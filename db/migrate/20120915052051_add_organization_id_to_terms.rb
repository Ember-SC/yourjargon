class AddOrganizationIdToTerms < ActiveRecord::Migration
  def change
    change_table :terms do |t|
      t.references :organization
    end
  end
end
