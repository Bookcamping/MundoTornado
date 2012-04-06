class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.belongs_to :user
      t.string :title, limit: 300
      t.string :author, limit: 100
      t.string :publisher, limit: 100
      t.text :content
      t.string :content_type, limit: 100
      t.text :settings
      t.timestamps
    end
    add_index :publications, :user_id
  end
end
