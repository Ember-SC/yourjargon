class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, nil => false
      t.string :password_digest, nil => false

      t.timestamps
    end
  end
end
