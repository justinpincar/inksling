class CreateInkTags < ActiveRecord::Migration
  def self.up
    create_table :ink_tags do |t|
      t.integer :ink_id
      t.integer :tag_id

      t.timestamps
    end

    add_index :ink_tags, :ink_id, :name => "index_ink_tags_on_ink_id"
    add_index :ink_tags, :tag_id, :name => "index_ink_tags_on_tag_id"
    add_index :ink_tags, [:ink_id, :tag_id], :name => "index_ink_tags_on_ink_id_and_tag_id", :unique => true
  end

  def self.down
    drop_table :ink_tags
  end
end
