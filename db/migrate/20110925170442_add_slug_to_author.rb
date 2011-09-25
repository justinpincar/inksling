class AddSlugToAuthor < ActiveRecord::Migration
  def self.up
    add_column :authors, :slug, :string
    add_index :authors, :slug, :unique => true

    add_column :inks, :slug, :string
    add_index :inks, :slug, :unique => true

    add_column :tags, :slug, :string
    add_index :tags, :slug, :unique => true
  end

  def self.down
    remove_column :authors, :slug
    remove_index :authors, :slug

    remove_column :inks, :slug
    remove_index :inks, :slug

    remove_column :tags, :slug
    remove_index :tags, :slug
  end
end
