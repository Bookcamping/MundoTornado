class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, limit: 300
      t.string :name, limit: 100
      t.string :slug, limit: 100
      t.string :password_digest
      t.integer :login_count, default: 0
      t.datetime :last_login_at 
      t.boolean :admin
      t.timestamps
    end
  end
end
