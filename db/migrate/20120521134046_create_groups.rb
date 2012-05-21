class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.belongs_to :user
      t.string :name, limit: 200
      t.string :description, limit: 600
      t.string :subdomain, limit: 100
      t.string :banner_image
      t.string :settings, limit: 500
      t.timestamps
    end
    
    add_index :groups, :user_id
  end
end
