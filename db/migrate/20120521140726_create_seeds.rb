class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.belongs_to :group
      t.belongs_to :user
      t.string :body, limit: 500
      t.timestamps
    end

    add_index :seeds, :group_id
    add_index :seeds, :user_id
  end
end
