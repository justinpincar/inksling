class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :text
      t.integer :author_id
      t.integer :ink_id

      t.timestamps
    end

    add_index :comments, :ink_id, :name => "index_comments_on_ink_id"
  end

  def self.down
    drop_table :comments
  end
end
