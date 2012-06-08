class AddChaptersAndScenes < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :title, limit: 300
      t.string :summary, limit: 500
      t.integer :scenes_count
      t.integer :position
      t.timestamps
    end
    add_index :chapters, :user_id
    add_index :chapters, :group_id

    create_table :scenes do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :chapter_id
      t.text :content
      t.string :content_type, limit: 30
      t.integer :participants_count
      t.integer :position
      t.timestamps
    end
    add_index :scenes, :user_id
    add_index :scenes, :group_id
    add_index :scenes, :chapter_id

    create_table :participants do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :scene_id
      t.integer :chapter_id
      t.datetime :created_at
    end
    add_index :participants, :scene_id
  end
end
