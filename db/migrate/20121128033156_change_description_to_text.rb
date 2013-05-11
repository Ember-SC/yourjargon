class ChangeDescriptionToText < ActiveRecord::Migration
  def up
    change_column :terms, :description, :text
  end

  def down
    change_column :terms, :description, :string
  end
end
