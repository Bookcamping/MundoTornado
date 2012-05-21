class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :type, limit: 50
      t.belongs_to :user
      t.belongs_to :group
      t.string :title, limit: 300
      t.string :author, limit: 100
      t.string :publisher, limit: 100
      t.text :content
      t.string :content_type, limit: 30
      t.string :settings, limit: 500
      t.timestamps
    end

    add_index :contents, :user_id
    add_index :contents, :type
    add_index :contents, :group_id
  end
end
