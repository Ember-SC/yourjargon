class ChangeTermName < ActiveRecord::Migration
  def up
     add_column :terms, :name, :string
     Term.find_each do |t|
       t.update_attribute(:name, t.term)
     end
     remove_column :terms, :term
  end

  def down
     add_column :terms, :term
  end
end
